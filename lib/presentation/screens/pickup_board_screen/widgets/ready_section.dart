import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/presentation/enums/index.dart';
import 'package:pickup_board/presentation/screens/pickup_board_screen/widgets/order_grid.dart';

class ReadySection extends StatelessWidget {
  const ReadySection({super.key, required this.orders});

  final List<OrderChip> orders;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return const SizedBox.shrink();

    const radius = BorderRadius.only(
      topLeft: Radius.circular(BoardMetrics.sectionCornerRadius),
      topRight: Radius.circular(BoardMetrics.sectionCornerRadius),
    );

    // The box-shadow lives on this outer, unclipped Container — shadows
    // paint outside the shape's own bounds, so putting it inside the
    // ClipRRect below (as before) silently clipped it away entirely.
    return Container(
      decoration: const BoxDecoration(
        borderRadius: radius,
        boxShadow: AppDecorations.sectionShadow,
      ),
      // ClipRRect + BackdropFilter reproduces `backdrop-filter: blur(40px)`
      // — only the fill/border/content need this clip, not the shadow.
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.readyBackground,
              borderRadius: radius,
            ),
            // Border painted on top (not via `decoration`) so it doesn't
            // shrink the label/grid content area.
            foregroundDecoration: const BoxDecoration(
              borderRadius: radius,
              border: Border.fromBorderSide(
                BorderSide(width: 24, color: AppColors.readySectionBorder),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 88, top: 40, bottom: 32),
                  child: Text('READY', style: AppTextStyles.sectionLabelOnDark),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: BoardMetrics.sectionBottomPadding,
                  ),
                  child: OrderGrid(orders: orders, variant: OrderChipVariant.ready),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
