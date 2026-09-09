import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/presentation/enums/index.dart';
import 'package:pickup_board/presentation/screens/pickup_board_screen/widgets/order_grid.dart';

class PreparingSection extends StatelessWidget {
  const PreparingSection({super.key, required this.orders});

  final List<OrderChip> orders;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return const SizedBox.shrink();

    const radius = BorderRadius.only(
      bottomLeft: Radius.circular(BoardMetrics.sectionCornerRadius),
      bottomRight: Radius.circular(BoardMetrics.sectionCornerRadius),
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
      // — it blurs whatever's already painted behind this card (the
      // background image) before the card's own fill/border/content paint
      // on top. Only the fill/border/content need this clip, not the shadow.
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          // Border painted as the two exact layers Figma lists — the opaque
          // base via the inner Container's foregroundDecoration, the
          // translucent tint on top via the outer one — instead of
          // pre-blending them into one color.
          child: Container(
            foregroundDecoration: const BoxDecoration(
              borderRadius: radius,
              border: Border.fromBorderSide(
                BorderSide(width: 24, color: AppColors.preparingSectionBorderTint),
              ),
            ),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.preparingBackground,
                borderRadius: radius,
              ),
              foregroundDecoration: const BoxDecoration(
                borderRadius: radius,
                border: Border.fromBorderSide(
                  BorderSide(width: 24, color: AppColors.preparingSectionBorderBase),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 88, top: 44, bottom: 32),
                    child: Text('PREPARING', style: AppTextStyles.sectionLabel),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: BoardMetrics.sectionBottomPadding,
                    ),
                    child: OrderGrid(orders: orders, variant: OrderChipVariant.preparing),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
