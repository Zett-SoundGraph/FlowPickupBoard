import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Shared box-shadow stacks for the Preparing/Ready cards and the status bar
/// — exact values from Figma.
class AppDecorations {
  const AppDecorations._();

  static const List<BoxShadow> sectionShadow = [
    BoxShadow(
      color: AppColors.sectionShadowAmbient,
      blurRadius: 104,
    ),
    BoxShadow(
      color: AppColors.sectionShadowDrop,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> overlayShadow = [
    BoxShadow(
      color: AppColors.sectionShadowAmbient,
      blurRadius: 104,
      offset: Offset(0, 20),
    ),
    BoxShadow(
      color: AppColors.sectionShadowDrop,
      blurRadius: 16,
      offset: Offset(0, 10),
    ),
  ];

  static const List<BoxShadow> statusBarShadow = [
    BoxShadow(
      color: AppColors.statusBarShadowAmbient,
      blurRadius: 80,
      offset: Offset(0, -10),
    ),
    BoxShadow(
      color: AppColors.statusBarShadowDrop,
      blurRadius: 24,
      offset: Offset(0, -8),
    ),
  ];
}
