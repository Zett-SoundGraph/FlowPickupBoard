import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/core/utils/index.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/presentation/enums/index.dart';

/// A single order pill.
///
/// [OrderChipVariant.preparing] follows the exact Figma spec: order-no size
/// and top margin come from [ChipMetrics] for the given [tier], and rows 1–4
/// show an icon+count gauge footer while row tier 5 shows a thin progress
/// bar instead (no icon/count — see variation-6x5.png).
///
/// [OrderChipVariant.ready] mirrors Preparing's sizing (same [ChipMetrics]
/// tiers) but with its own fill/border colors, white order-no text, and no
/// footer at all at row tier 5 (not even a thin bar).
class OrderChipWidget extends StatelessWidget {
  const OrderChipWidget({
    super.key,
    required this.chip,
    required this.variant,
    this.tier = ChipRowTier.compact,
  });

  final OrderChip chip;
  final OrderChipVariant variant;
  final ChipRowTier tier;

  bool get _isReady => variant == OrderChipVariant.ready;

  @override
  Widget build(BuildContext context) {
    return _isReady ? _buildReady() : _buildPreparing();
  }

  Widget _buildPreparing() {
    final radius = ChipMetrics.heightForTier(tier) / 2;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.chipWhite,
        borderRadius: BorderRadius.circular(radius),
      ),
      // Border is painted on top instead of via decoration so it doesn't eat
      // into the content's available height (Container auto-insets a child
      // by the border width when the border lives in `decoration`, which
      // was overflowing the row-tier-4 gauge footer by ~5px).
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: 4, color: AppColors.chipProgressTrack),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ..._numberSection(
              AppTextStyles.preparingChipNumber(
                ChipMetrics.numberFontSizeForTier(tier),
              ),
            ),
            if (ChipMetrics.hasGaugeFooter(tier))
              _gaugeFooter()
            else
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _thinGaugeBar(),
              ),
          ],
        ),
      ),
    );
  }

  /// Row tiers 1–4 top-anchor the number (explicit top margin + a trailing
  /// [Spacer] so a footer below balances it visually); row tier 5 has
  /// little or no footer, so the number is vertically centered in whatever
  /// space remains instead. Returns sibling widgets for the enclosing
  /// max-size [Column] rather than a single widget, since [Spacer] only
  /// works as a direct flex child of it.
  List<Widget> _numberSection(TextStyle style) {
    final text = Text(chip.orderNo, textAlign: TextAlign.center, style: style);
    if (tier == ChipRowTier.five) {
      return [Expanded(child: Center(child: text))];
    }
    return [
      Padding(
        padding: EdgeInsets.only(top: ChipMetrics.numberTopMarginForTier(tier)),
        child: text,
      ),
      const Spacer(),
    ];
  }

  Widget _gaugeFooter() {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: AppColors.chipProgressTrack),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: chip.progress.clamp(0.0, 1.0),
            child: Container(color: AppColors.chipProgressFill),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AssetPaths.coffeeIcon, width: 40, height: 40),
                const SizedBox(width: 8),
                Text('${chip.cupCount}', style: AppTextStyles.chipCupCount),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _thinGaugeBar() {
    return SizedBox(
      width: 178,
      height: 11.93,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: AppColors.chipProgressTrack),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: chip.progress.clamp(0.0, 1.0),
              child: Container(color: AppColors.chipProgressFill),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReady() {
    final radius = ChipMetrics.heightForTier(tier) / 2;
    return Container(
      decoration: BoxDecoration(
        color: chip.isOverdue ? AppColors.chipReadyOverdue : AppColors.chipReadyBase,
        borderRadius: BorderRadius.circular(radius),
      ),
      // See _buildPreparing — border painted on top so it doesn't shrink the
      // content area.
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: 4, color: AppColors.chipReadyBorder),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ..._numberSection(
              AppTextStyles.readyChipNumber(
                ChipMetrics.numberFontSizeForTier(tier),
              ),
            ),
            // Row tier 5 has no footer at all (unlike Preparing's thin bar).
            if (ChipMetrics.hasGaugeFooter(tier)) _readyGaugeFooter(),
          ],
        ),
      ),
    );
  }

  Widget _readyGaugeFooter() {
    // Always fully filled — Ready orders are already done, so there's no
    // partial-progress split like Preparing's gauge.
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: Container(
        color: AppColors.chipReadyFooter,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AssetPaths.coffeeIcon, width: 40, height: 40),
              const SizedBox(width: 8),
              Text('${chip.cupCount}', style: AppTextStyles.chipCupCount),
            ],
          ),
        ),
      ),
    );
  }
}
