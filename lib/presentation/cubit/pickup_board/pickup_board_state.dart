import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pickup_board/domain/entities/index.dart';

part 'pickup_board_state.freezed.dart';

@freezed
abstract class PickupBoardState with _$PickupBoardState {
  const factory PickupBoardState({
    @Default([]) List<OrderChip> preparingOrders,
    @Default([]) List<OrderChip> readyOrders,
    MachineStatus? machineStatus,
    PickupNotice? pickupNotice,
    String? pickupNoticeMessage,
    String? currentDrinkImageUrl,
    // Bumped by PickupBoardCubit every time a new bottom-bar message is
    // shown — StatusBar keys its AnimatedSwitcher off this so it always
    // triggers the slide transition, even if two consecutive messages
    // happened to render identically.
    @Default(0) int bottomBarEventSeq,
  }) = _PickupBoardState;
}
