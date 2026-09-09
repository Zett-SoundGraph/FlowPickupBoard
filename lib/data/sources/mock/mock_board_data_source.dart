import 'dart:async';

import 'package:pickup_board/domain/entities/index.dart';

abstract interface class IBoardDataSource {
  Stream<BoardSnapshot> observeBoardSnapshot();
}

/// Cycles through sample [BoardSnapshot]s so the UI can be reviewed against
/// every layout case (empty / partial / dense grids) without a live MQTT
/// connection. Replace with a real MQTT-backed [IBoardDataSource] once
/// FlowHub's `beta/flowhub/leader/update` payload shape is wired in — nothing
/// above this layer needs to change.
class MockBoardDataSource implements IBoardDataSource {
  static const _cycleInterval = Duration(seconds: 4);
  static const _pickupPulseInterval = Duration(seconds: 8);
  static const _pickupDisplayDuration = Duration(seconds: 3);

  @override
  Stream<BoardSnapshot> observeBoardSnapshot() {
    final controller = StreamController<BoardSnapshot>();
    final scenarios = _scenarios;
    var scenarioIndex = 0;
    PickupNotice? pickupNotice;
    Timer? pickupClearTimer;

    void emit() {
      controller.add(scenarios[scenarioIndex].copyWith(pickupNotice: pickupNotice));
    }

    emit();

    final cycleTimer = Timer.periodic(_cycleInterval, (_) {
      scenarioIndex = (scenarioIndex + 1) % scenarios.length;
      emit();
    });

    // Pulses the pickup-complete overlay on independently of the density
    // cycle above, purely so it's visible in the mock demo — real triggering
    // will come from FlowHub's pickup-complete event once MQTT is wired in.
    final pickupTimer = Timer.periodic(_pickupPulseInterval, (_) {
      pickupNotice = const PickupNotice(orderNo: 'K1000');
      emit();
      pickupClearTimer?.cancel();
      pickupClearTimer = Timer(_pickupDisplayDuration, () {
        pickupNotice = null;
        emit();
      });
    });

    controller.onCancel = () {
      cycleTimer.cancel();
      pickupTimer.cancel();
      pickupClearTimer?.cancel();
    };

    return controller.stream;
  }

  static List<BoardSnapshot> get _scenarios => [
        _scenario(preparingCount: 0, readyCount: 0),
        _scenario(preparingCount: 4, readyCount: 2),
        _scenario(preparingCount: 8, readyCount: 8),
        _scenario(preparingCount: 12, readyCount: 12),
        _scenario(preparingCount: 6, readyCount: 3),
        _scenario(preparingCount: 0, readyCount: 1),
        _scenario(preparingCount: 2, readyCount: 0),
        _scenario(preparingCount: 15, readyCount: 15),
        _scenario(preparingCount: 20, readyCount: 20),
        _scenario(preparingCount: 30, readyCount: 30),
      ];

  static BoardSnapshot _scenario({
    required int preparingCount,
    required int readyCount,
  }) {
    // No status-bar content here anymore — that's entirely event-driven now
    // (see PickupBoardCubit's message queue, fed by BoardSnapshot's
    // newBottomBarEvents), and this mock has no Language List sheet access
    // to resolve one. Only the order-grid density cases matter for this
    // preview tool.
    return BoardSnapshot(
      preparingOrders: _preparingChips(preparingCount),
      readyOrders: _readyChips(readyCount),
    );
  }

  /// Ascending order numbers (K1001, K1002, ...) — the earliest-placed order
  /// is first and closest to done, so progress decreases along the list.
  static List<OrderChip> _preparingChips(int count) {
    return List.generate(count, (i) {
      final progress = count <= 1 ? 0.8 : 0.85 - (i / (count - 1)) * 0.65;
      return OrderChip(
        orderNo: 'K${1001 + i}',
        cupCount: 1,
        progress: progress.clamp(0.1, 0.85),
      );
    });
  }

  /// Descending order numbers (K1000, K0999, M0998, ...) — most-recently
  /// completed order first. Real overdue status will come from FlowHub's
  /// elapsed-time tracking; the first two are flagged here purely so the
  /// mock demo shows what the overdue fill looks like.
  static List<OrderChip> _readyChips(int count) {
    return List.generate(count, (i) {
      final number = 1000 - i;
      final prefix = (i ~/ 2).isEven ? 'K' : 'M';
      return OrderChip(
        orderNo: '$prefix${number.toString().padLeft(4, '0')}',
        cupCount: 1,
        progress: 1,
        isOverdue: i < 2,
      );
    });
  }
}
