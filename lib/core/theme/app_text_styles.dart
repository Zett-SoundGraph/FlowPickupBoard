import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Type scale — Preparing, Ready, status bar, and pickup-overlay values are
/// all exact Figma values.
class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w800,
    height: 1.35,
    letterSpacing: 0,
    color: AppColors.readyBackground,
  );

  static const TextStyle sectionLabelOnDark = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w800,
    height: 1.35,
    letterSpacing: 0,
    color: AppColors.readyLabelColor,
  );

  /// Preparing chip order-no — font size varies by row tier
  /// ([ChipMetrics.numberFontSizeForTier]), everything else is fixed.
  static TextStyle preparingChipNumber(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        height: 1.35,
        color: AppColors.chipNumberColor,
      );

  /// Ready chip order-no — same size/weight/line-height rule as
  /// [preparingChipNumber], just white instead of near-black.
  static TextStyle readyChipNumber(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        height: 1.35,
        color: AppColors.chipWhite,
      );

  /// Cup-count text in the gauge footer — shared by Preparing and Ready.
  static const TextStyle chipCupCount = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.45,
    letterSpacing: -0.2,
    color: AppColors.chipCountColor,
  );

  static const TextStyle statusOrderCode = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 1.36,
    letterSpacing: 0,
    color: AppColors.statusOrderCodeColor,
  );

  static const TextStyle statusMessage = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w400,
    height: 1.46,
    letterSpacing: -0.88,
    color: AppColors.statusText,
  );

  static const TextStyle overlayLabel = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    height: 1.28,
    letterSpacing: -1.12,
    color: AppColors.overlayLabelColor,
  );

  static const TextStyle overlayOrderNo = TextStyle(
    fontSize: 152,
    fontWeight: FontWeight.w800,
    height: 1.36,
    letterSpacing: 0,
    color: AppColors.overlayOrderNoColor,
  );

  static const TextStyle overlaySubtitle = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    height: 1.28,
    letterSpacing: -1.28,
    color: AppColors.overlaySubtitleColor,
  );
}
