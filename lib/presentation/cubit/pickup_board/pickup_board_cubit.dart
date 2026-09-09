import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/domain/usecases/index.dart';
import 'package:pickup_board/presentation/cubit/pickup_board/pickup_board_state.dart';

@injectable
class PickupBoardCubit extends Cubit<PickupBoardState> {
  PickupBoardCubit(this._observeBoardSnapshot, this._getMenuImage, this._getTranslation)
      : super(const PickupBoardState()) {
    _subscription = _observeBoardSnapshot().listen(_onSnapshot);
  }

  // Fixed Language ID for the pickup-complete circle's message (Language
  // List sheet: Device=Pickup Board, UI Page=Pickup Notice, Serial=0001) —
  // this one slot has one stable id, unlike the bottom bar's per-event rows.
  static const _pickupNoticeLanguageId = 'PB.PN.0001';
  // Matches the sheet's own English row for this id — shown if the sheet
  // hasn't loaded yet (or is unreachable) rather than nothing at all.
  static const _pickupNoticeFallback = 'Your order is ready for pickup.';
  // Fixed display name for the "[Coffee Machine]" template token — only one
  // physical coffee machine (Caye) exists today.
  static const _coffeeMachineName = 'Caye';

  final ObserveBoardSnapshotUsecase _observeBoardSnapshot;
  final GetMenuImageUsecase _getMenuImage;
  final GetTranslationUsecase _getTranslation;
  StreamSubscription<BoardSnapshot>? _subscription;

  // Bottom-bar message queue: each raw event is resolved (translated +
  // placeholders filled) into a MachineStatus as soon as it arrives, then
  // displayed one at a time — the current one holds for
  // BoardMetrics.bottomBarSlideDuration + bottomBarMinHoldDuration before
  // advancing to whatever's next queued (if anything; an empty queue just
  // leaves the current message up indefinitely). Multiple events arriving
  // in the same broadcast (e.g. a new order AND another one's stage
  // changing) queue in the order the snapshot's own orders list had them,
  // which is as close to "chronological" as the data allows.
  final List<MachineStatus> _messageQueue = [];
  Timer? _advanceTimer;
  int _bottomBarEventSeq = 0;

  void _onSnapshot(BoardSnapshot snapshot) {
    final notice = snapshot.pickupNotice;
    for (final raw in snapshot.newBottomBarEvents) {
      _messageQueue.add(_resolveMessage(raw));
    }

    emit(state.copyWith(
      preparingOrders: snapshot.preparingOrders,
      readyOrders: snapshot.readyOrders,
      pickupNotice: notice,
      pickupNoticeMessage: notice == null
          ? null
          : (_getTranslation(languageId: _pickupNoticeLanguageId, lang: notice.lang) ??
              _pickupNoticeFallback),
    ));

    _advanceIfIdle();
  }

  /// Resolves one raw event into fully-localized bar content — looks up its
  /// Language List template for the order's own language, then fills in
  /// whichever placeholder tokens that template actually uses.
  MachineStatus _resolveMessage(BottomBarRawEvent raw) {
    final template = _getTranslation(languageId: raw.languageId, lang: raw.lang) ?? '';
    final message = template
        .replaceAll('[Order Number]', raw.orderNo)
        .replaceAll('[Menu Name]', raw.menuName)
        .replaceAll('[Dispenser]', _humanize(raw.dispenserName))
        .replaceAll('[Coffee Machine]', _coffeeMachineName);
    return MachineStatus(
      machineOrderNo: raw.orderNo,
      message: message,
      skuNo: raw.skuNo.isEmpty ? null : raw.skuNo,
      totalCups: raw.totalCups,
      lang: raw.lang,
    );
  }

  String _humanize(String raw) => raw.replaceAll('_', ' ');

  /// Starts displaying the queue if nothing is currently showing — a no-op
  /// while a message is already up (the running [_advanceTimer] picks up
  /// whatever's newly queued when it fires).
  void _advanceIfIdle() {
    if (_advanceTimer != null || _messageQueue.isEmpty) return;
    _showNext();
  }

  void _showNext() {
    if (_messageQueue.isEmpty) return;
    final next = _messageQueue.removeAt(0);
    _bottomBarEventSeq++;
    final skuNo = next.skuNo;
    emit(state.copyWith(
      machineStatus: next,
      currentDrinkImageUrl: skuNo == null ? null : _getMenuImage(skuNo),
      bottomBarEventSeq: _bottomBarEventSeq,
    ));
    _advanceTimer = Timer(
      BoardMetrics.bottomBarSlideDuration + BoardMetrics.bottomBarMinHoldDuration,
      () {
        _advanceTimer = null;
        if (_messageQueue.isNotEmpty) _showNext();
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _advanceTimer?.cancel();
    return super.close();
  }
}
