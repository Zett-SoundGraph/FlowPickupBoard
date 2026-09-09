import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/data/sources/mock/mock_board_data_source.dart'
    show IBoardDataSource;
import 'package:pickup_board/domain/entities/index.dart';

/// Real MQTT-backed [IBoardDataSource] — subscribes to FlowHub's
/// `beta/flowhub/board/update` broadcast, a lightweight, board-specific
/// topic kept deliberately separate from the internal KDS leader/follower
/// sync topic (see kds's `BoardUpdateMessage` doc comment). Each broadcast
/// carries a minimal per-order summary (orderNo, tab, totalCups, lang, and
/// per-item seq/skuNo/temp/menuName/stage/dispenserName) which this class
/// reduces into a [BoardSnapshot].
///
/// The bottom status-bar is entirely event-driven now: this class only
/// edge-detects bottom-bar-worthy events (order received / a sub-item's
/// ProductionStage changed / order picked up) against its own running
/// state and emits them as raw, untranslated [BottomBarRawEvent]s —
/// [PickupBoardCubit] is the one that queues them, resolves each one's
/// Language List template + fills in its placeholder tokens, and times
/// the slide transition between them.
@Singleton(as: IBoardDataSource)
class MqttBoardDataSource implements IBoardDataSource {
  static const _tag = 'MqttBoard';
  static const _topicBoardUpdate = 'beta/flowhub/board/update';
  static const _heartbeatInterval = Duration(seconds: 5);
  static String get _topicHeartbeat =>
      'beta/system/heartbeat/${NetworkConstants.mqttDeviceId}';

  static const _pickupNoticeDuration = Duration(seconds: 5);

  // kds's ProductionStage enum name -> this Language List "Language ID".
  // 'none' and any name not in this map never produce a bottom-bar event —
  // 'cayeCanceled' is a scaffold kds doesn't set yet (no cancel-signal
  // trigger exists there today), but is included here so nothing needs to
  // change on this side once that trigger is added.
  static const _languageIdForStage = {
    'nudofDispensing': 'PB.BB.0002',
    'cayeCommandSent': 'PB.BB.0003',
    'cayeExtracting': 'PB.BB.0004',
    'cayeComplete': 'PB.BB.0005',
    'cayeCanceled': 'PB.BB.0006',
    'cayeFailed': 'PB.BB.0007',
  };

  MqttServerClient? _client;
  Timer? _heartbeatTimer;
  Timer? _pickupNoticeClearTimer;
  Timer? _retryTimer;
  // autoReconnect only takes over once a client has connected successfully
  // at least once — it never fires for a connect() call that fails outright
  // (e.g. broker/network not up yet), so a failed FIRST attempt would
  // otherwise never retry on its own. Most visible at boot: a startup-app
  // launch can race Android's own network stack coming up, lose that race
  // once, and then sit disconnected forever until someone manually
  // relaunches the app (by which point the network is already up, so it
  // "just works" and looks unrelated to this).
  static const _retryInterval = Duration(seconds: 5);
  final StreamController<BoardSnapshot> _snapshotController =
      StreamController<BoardSnapshot>.broadcast();

  /// Last-seen tab per orderNo, so a fresh broadcast (always a full
  /// snapshot, not a delta) can still detect the specific edge of "just
  /// became Call" and fire the pickup-complete circle exactly once — also
  /// doubles as "have we ever seen this order before" for the PB.BB.0001
  /// order-received event (an order not yet in this map at all).
  final Map<String, String> _lastKnownTab = {};
  /// Last-seen ProductionStage name per "orderNo|seq", so a stage change
  /// (PB.BB.0002-0007) is only reported once, the same way [_lastKnownTab]
  /// gates the pickup-complete circle.
  final Map<String, String> _lastKnownStage = {};
  PickupNotice? _pickupNotice;
  // Latest grid content, kept separately from the notice so the 5s-later
  // clear-timer can re-emit whatever is CURRENT at that point rather than
  // the (by then stale) snapshot captured when the notice first fired.
  List<OrderChip> _latestPreparing = const [];
  List<OrderChip> _latestReady = const [];

  MqttBoardDataSource() {
    unawaited(_connect());
  }

  @override
  Stream<BoardSnapshot> observeBoardSnapshot() => _snapshotController.stream;

  /// Connects to the broker and subscribes to the board-update topic.
  /// 1. Configure the client with credentials and a client identifier
  /// 2. Connect and verify the resulting connection state
  /// 3. Subscribe to beta/flowhub/board/update
  /// 4. Start the periodic heartbeat publish
  Future<void> _connect() async {
    _retryTimer?.cancel();

    // Waits for this device's own subnet to be confirmed before ever
    // dialing out — a brand-new site (whose subnet doesn't match
    // NetworkConstants.mqttBrokerHost's currently-deployed-site fallback)
    // would otherwise always waste a doomed first attempt before
    // self-correcting on a later retry.
    await LocalSubnetResolver.ready;

    final client = MqttServerClient(
      NetworkConstants.mqttBrokerHost,
      NetworkConstants.mqttDeviceId,
    );
    client.port = NetworkConstants.mqttBrokerPort;
    client.keepAlivePeriod = 15;
    client.autoReconnect = true;
    client.logging(on: false);
    client.onConnected = () => _log(
          'Connected to broker (${NetworkConstants.mqttBrokerHost}:${NetworkConstants.mqttBrokerPort})',
        );
    client.onDisconnected = () => _log('Disconnected from broker');

    client.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(NetworkConstants.mqttDeviceId)
        .authenticateAs(
          NetworkConstants.mqttUsername,
          NetworkConstants.mqttPassword,
        );

    try {
      await client.connect();
    } catch (e) {
      _log('Connect error: $e — retrying in ${_retryInterval.inSeconds}s');
      client.disconnect();
      _scheduleRetry();
      return;
    }

    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _log('Connection failed: ${client.connectionStatus} — retrying in ${_retryInterval.inSeconds}s');
      client.disconnect();
      _scheduleRetry();
      return;
    }

    _client = client;
    client.subscribe(_topicBoardUpdate, MqttQos.atLeastOnce);
    client.updates!.listen(_handleMessage);
    _startHeartbeat();
  }

  void _scheduleRetry() {
    _retryTimer?.cancel();
    _retryTimer = Timer(_retryInterval, () => unawaited(_connect()));
  }

  void _handleMessage(List<MqttReceivedMessage<MqttMessage>> events) {
    for (final event in events) {
      if (event.topic != _topicBoardUpdate) continue;
      try {
        final message = event.payload as MqttPublishMessage;
        final payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        // Empty payload = retained-message-cleared, not a real update.
        if (payload.trim().isEmpty) continue;
        final json = jsonDecode(payload) as Map<String, dynamic>;
        _snapshotController.add(_toSnapshot(json));
      } catch (e) {
        _log('Message handling error on ${event.topic}: $e');
      }
    }
  }

  /// tab=='done' orders are dropped entirely (picked up, nothing left to
  /// show); tab=='call' become Ready chips, everything else (newOrder/brew)
  /// stays in Preparing. Also detects several edges against the data
  /// source's own running state — each broadcast is a full snapshot, not a
  /// delta, so [_lastKnownTab]/[_lastKnownStage] are what make any of these
  /// detectable at all:
  /// - an order newly entering Call (vs. any prior tab) fires the 5s
  ///   pickup-complete circle AND a PB.BB.0009 bottom-bar event
  /// - an order newly entering New (first-seen, or a manual swipe/tap back
  ///   from a later tab) emits a PB.BB.0001 event
  /// - an order newly entering Brew emits a PB.BB.0010 event
  /// - an order newly entering Done emits a PB.BB.0008 event
  /// - a sub-item's `stage` changing emits a PB.BB.0002-0007 event (see
  ///   [_languageIdForStage])
  ///
  /// All of the tab-driven events above (0001/0009/0010/0008) fire
  /// identically whether the tab change came from a real hardware signal or
  /// a manual operator override (swipe / New-Brew-Call-Done button) — KDS
  /// derives `tab` purely from current item state and broadcasts whatever it
  /// currently is, with no marker distinguishing how it got there, so there
  /// is nothing here that COULD special-case one vs. the other even if it
  /// wanted to. Only the per-item `stage` messages (0002-0007) can differ,
  /// since a manual move intentionally never touches `stage` for Caye-only
  /// items (no real Caye command is sent) — the 0010 event exists precisely
  /// to guarantee a message shows for those items too.
  BoardSnapshot _toSnapshot(Map<String, dynamic> json) {
    final ordersJson = (json['orders'] as List?) ?? const [];
    final preparing = <OrderChip>[];
    final ready = <OrderChip>[];
    final seenOrderNos = <String>{};
    final seenItemKeys = <String>{};
    final newEvents = <BottomBarRawEvent>[];
    String? justCalledOrderNo;
    String justCalledLang = '';

    for (final entry in ordersJson) {
      final order = entry as Map<String, dynamic>;
      final orderNo = order['orderNo']?.toString() ?? '';
      final tab = order['tab']?.toString() ?? 'newOrder';
      final lang = order['lang']?.toString() ?? '';
      final totalCups = (order['totalCups'] as num?)?.toInt() ?? 0;
      seenOrderNos.add(orderNo);

      // Order-level bottom-bar events (0001/0008) show one drink image even
      // though an order can carry multiple items — always the first item
      // (seq==1), same as how a printed label/receipt would lead with it.
      final orderItems = (order['items'] as List?) ?? const [];
      Map<String, dynamic>? firstItem;
      for (final itemEntry in orderItems) {
        final item = itemEntry as Map<String, dynamic>;
        if ((item['seq'] as num?)?.toInt() == 1) {
          firstItem = item;
          break;
        }
      }
      final firstItemSkuNo = firstItem?['skuNo']?.toString() ?? '';
      final firstItemMenuName = firstItem?['menuName']?.toString() ?? '';
      final firstItemDispenserName = firstItem?['dispenserName']?.toString() ?? '';

      // Watched by tab value alone (not "first seen"), so a manual swipe/tap
      // back into New (e.g. Brew→New) re-fires the same "order received"
      // message a real new order would get — Pickup Board has no way to
      // tell a manual tab override from a real signal (both just change
      // `tab` in the broadcast the same way), and the user wants the bottom
      // bar to stay consistent regardless of which one happened.
      if (tab == 'newOrder' && _lastKnownTab[orderNo] != 'newOrder') {
        newEvents.add(BottomBarRawEvent(
          orderNo: orderNo,
          lang: lang,
          languageId: 'PB.BB.0001',
          totalCups: totalCups,
          skuNo: firstItemSkuNo,
          menuName: firstItemMenuName,
          dispenserName: firstItemDispenserName,
        ));
      }

      // Order-level "production started" — always uses the first item, same
      // as 0001/0008/0009, regardless of whether every sub-item is
      // Nudof/Caye/combo. This is what makes a MANUAL New→Brew move (which
      // KDS deliberately leaves `stage` untouched for Caye-only items, since
      // no real Caye command is sent) still show a bottom-bar message —
      // the per-item PB.BB.0002-0004 stage messages only fire for items
      // whose `stage` actually changes, which never happens for a Caye-only
      // item on a manual move.
      if (tab == 'brew' && _lastKnownTab[orderNo] != 'brew') {
        newEvents.add(BottomBarRawEvent(
          orderNo: orderNo,
          lang: lang,
          languageId: 'PB.BB.0010',
          totalCups: totalCups,
          skuNo: firstItemSkuNo,
          menuName: firstItemMenuName,
          dispenserName: firstItemDispenserName,
        ));
      }

      if (tab == 'call' && _lastKnownTab[orderNo] != 'call') {
        justCalledOrderNo = orderNo;
        justCalledLang = lang;
        newEvents.add(BottomBarRawEvent(
          orderNo: orderNo,
          lang: lang,
          languageId: 'PB.BB.0009',
          totalCups: totalCups,
          skuNo: firstItemSkuNo,
          menuName: firstItemMenuName,
          dispenserName: firstItemDispenserName,
        ));
      }
      // The order currently showing the pickup-complete circle has now
      // actually been picked up — stop celebrating "ready for pickup" for
      // it right away instead of waiting out the rest of the 5s timer.
      if (tab == 'done' && _pickupNotice?.orderNo == orderNo) {
        _pickupNoticeClearTimer?.cancel();
        _pickupNotice = null;
      }
      if (tab == 'done' && _lastKnownTab[orderNo] != 'done') {
        newEvents.add(BottomBarRawEvent(
          orderNo: orderNo,
          lang: lang,
          languageId: 'PB.BB.0008',
          totalCups: totalCups,
          skuNo: firstItemSkuNo,
          menuName: firstItemMenuName,
          dispenserName: firstItemDispenserName,
        ));
      }
      _lastKnownTab[orderNo] = tab;

      if (tab == 'done') continue;

      final isReady = tab == 'call';
      // FlowHub pushes real progress continuously (estimated-time for Nudof,
      // real telemetry for Caye — see kds's SubItem phase-tracking fields);
      // Ready orders are already done regardless of what's in the payload.
      final progress = (order['progress'] as num?)?.toDouble() ?? 0.0;
      final chip = OrderChip(
        orderNo: orderNo,
        cupCount: totalCups,
        progress: isReady ? 1.0 : progress,
      );
      (isReady ? ready : preparing).add(chip);

      for (final itemEntry in orderItems) {
        final item = itemEntry as Map<String, dynamic>;
        final seq = (item['seq'] as num?)?.toInt() ?? 0;
        final itemKey = '$orderNo|$seq';
        seenItemKeys.add(itemKey);
        final stage = item['stage']?.toString() ?? 'none';
        final languageId = _languageIdForStage[stage];
        if (languageId != null && _lastKnownStage[itemKey] != stage) {
          newEvents.add(BottomBarRawEvent(
            orderNo: orderNo,
            lang: lang,
            languageId: languageId,
            skuNo: item['skuNo']?.toString() ?? '',
            totalCups: totalCups,
            menuName: item['menuName']?.toString() ?? '',
            dispenserName: item['dispenserName']?.toString() ?? '',
          ));
        }
        _lastKnownStage[itemKey] = stage;
      }
    }

    // Orders/items no longer present in the broadcast (shouldn't normally
    // happen — FlowHub keeps every order in its list — but keeps these maps
    // from silently drifting if that ever changes) don't need tracking
    // anymore.
    _lastKnownTab.removeWhere((orderNo, _) => !seenOrderNos.contains(orderNo));
    _lastKnownStage.removeWhere((key, _) => !seenItemKeys.contains(key));

    _latestPreparing = preparing;
    _latestReady = ready;

    if (justCalledOrderNo != null) {
      _pickupNotice = PickupNotice(orderNo: justCalledOrderNo, lang: justCalledLang);
      _pickupNoticeClearTimer?.cancel();
      _pickupNoticeClearTimer = Timer(_pickupNoticeDuration, () {
        _pickupNotice = null;
        // Reads the fields (not the `preparing`/`ready` locals above) since
        // several more broadcasts may have landed in the 5s since this
        // notice started — re-emitting a stale grid would roll the board
        // backward in time. No new bottom-bar events here — this is just a
        // grid re-paint, not a fresh broadcast to edge-detect against.
        _snapshotController.add(
          BoardSnapshot(preparingOrders: _latestPreparing, readyOrders: _latestReady),
        );
      });
    }

    return BoardSnapshot(
      preparingOrders: preparing,
      readyOrders: ready,
      pickupNotice: _pickupNotice,
      newBottomBarEvents: newEvents,
    );
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _publishHeartbeat();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (_) => _publishHeartbeat());
  }

  void _publishHeartbeat() {
    final client = _client;
    if (client == null ||
        client.connectionStatus?.state != MqttConnectionState.connected) {
      return;
    }
    final builder = MqttClientPayloadBuilder();
    // addUTF8String, not addString — see kds's mqtt_data_source.dart for why
    // addString silently corrupts any non-ASCII payload.
    builder.addUTF8String(jsonEncode({
      'status': 'online',
      'deviceName': NetworkConstants.mqttDeviceName,
      'deviceId': NetworkConstants.mqttDeviceId,
    }));
    client.publishMessage(
      _topicHeartbeat,
      MqttQos.atMostOnce,
      builder.payload!,
      retain: true,
    );
  }

  void _log(String message) => debugPrint('[$_tag] $message');

  void dispose() {
    _heartbeatTimer?.cancel();
    _pickupNoticeClearTimer?.cancel();
    _retryTimer?.cancel();
    _client?.disconnect();
    _snapshotController.close();
  }
}
