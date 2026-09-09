import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pickup_board/domain/entities/bottom_bar_event/bottom_bar_event.dart';
import 'package:pickup_board/domain/entities/order_chip/order_chip.dart';
import 'package:pickup_board/domain/entities/pickup_notice/pickup_notice.dart';

part 'board_snapshot.freezed.dart';

/// The full state of the display board at a point in time — everything the
/// screen needs to render a single frame.
@freezed
abstract class BoardSnapshot with _$BoardSnapshot {
  const factory BoardSnapshot({
    required List<OrderChip> preparingOrders,
    required List<OrderChip> readyOrders,
    PickupNotice? pickupNotice,
    // Bottom-bar-worthy events detected THIS broadcast (edge-detected
    // against the data source's own running state) — usually empty; the
    // cubit queues these up and displays them one at a time (see
    // PickupBoardCubit's message queue). Not a replacement for
    // MachineStatus — that's now entirely cubit-derived from this queue,
    // not sourced from the snapshot at all.
    @Default([]) List<BottomBarRawEvent> newBottomBarEvents,
  }) = _BoardSnapshot;
}
