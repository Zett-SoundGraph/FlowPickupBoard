import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/presentation/cubit/pickup_board/index.dart';
import 'package:pickup_board/presentation/screens/pickup_board_screen/widgets/index.dart';

class PickupBoardScreen extends StatelessWidget {
  const PickupBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PickupBoardCubit, PickupBoardState>(
        builder: (context, state) {
          return Stack(
            children: [
              const BackgroundLayer(),
              // StatusBar is painted first (behind) so Ready's drop-shadow —
              // which bleeds below Ready's own box — renders on top of the
              // status bar's opaque background instead of being covered by
              // it. The Padding below reserves exactly the status bar's
              // height so Ready still lands in the right place.
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: StatusBar(
                  machineStatus: state.machineStatus,
                  drinkImageUrl: state.currentDrinkImageUrl,
                  eventSeq: state.bottomBarEventSeq,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: BoardMetrics.statusBarHeight),
                // Without stretch, Column sizes its width to its widest
                // child (default CrossAxisAlignment.center) — when both
                // sections are empty (SizedBox.shrink(), 0 width), the
                // Column collapses to 0 width, and since this is the Stack's
                // only non-positioned child, the whole Stack (fit: loose by
                // default) collapses to 0 width too — dragging every
                // Positioned child (BackgroundLayer included) down with it.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PreparingSection(orders: state.preparingOrders),
                    const Expanded(child: SizedBox.shrink()),
                    ReadySection(orders: state.readyOrders),
                  ],
                ),
              ),
              if (state.pickupNotice != null)
                PickupCompleteOverlay(
                  notice: state.pickupNotice!,
                  message: state.pickupNoticeMessage ?? '',
                ),
            ],
          );
        },
      ),
    );
  }
}
