import 'package:flutter_test/flutter_test.dart';

import 'package:pickup_board/presentation/cubit/pickup_board/pickup_board_state.dart';

void main() {
  test('PickupBoardState defaults to empty grids with no bottom-bar message', () {
    const state = PickupBoardState();
    expect(state.preparingOrders, isEmpty);
    expect(state.readyOrders, isEmpty);
    expect(state.machineStatus, isNull);
    expect(state.pickupNotice, isNull);
    expect(state.bottomBarEventSeq, 0);
  });
}
