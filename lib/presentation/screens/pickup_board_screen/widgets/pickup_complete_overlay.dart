import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/domain/entities/index.dart';

/// Transient "order ready" popup shown right after an order moves from
/// Preparing into Ready. Dims the whole board except the status bar while
/// it's up.
class PickupCompleteOverlay extends StatelessWidget {
  const PickupCompleteOverlay({super.key, required this.notice, required this.message});

  final PickupNotice notice;
  // Resolved via GetTranslationUsecase from notice.lang (see
  // PickupBoardCubit) — not derived from `notice` itself so this widget
  // doesn't need to know about the Language List sheet at all.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned.fill(
            bottom: BoardMetrics.statusBarHeight,
            child: IgnorePointer(
              child: Container(color: AppColors.pickupDimBackground),
            ),
          ),
          Positioned(
            top: 227.5,
            left: 211,
            child: _circle(),
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 1178,
      height: 1178,
      decoration: const BoxDecoration(
        color: AppColors.overlayBackground,
        shape: BoxShape.circle,
        boxShadow: AppDecorations.overlayShadow,
      ),
      // Border painted on top so it doesn't shrink the content area (same
      // reasoning as the order chips — see OrderChipWidget).
      foregroundDecoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(width: 44, color: AppColors.overlayBorder),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 384.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AssetPaths.orderIcon, width: 56, height: 72),
                const SizedBox(width: 16),
                Text('Order No.', style: AppTextStyles.overlayLabel),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              notice.orderNo,
              textAlign: TextAlign.center,
              style: AppTextStyles.overlayOrderNo,
            ),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.overlaySubtitle.copyWith(
                fontFamily: AppFonts.fontFamilyForLanguage(notice.lang),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
