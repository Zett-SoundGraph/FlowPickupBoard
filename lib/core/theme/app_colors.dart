import 'package:flutter/material.dart';

/// Palette — background-layer colors (preparingBackground, readyBackground,
/// statusBarBackground) and section shadows are exact values from Figma.
/// Everything else (label/chip text colors) is still an approximation
/// pending spec.
class AppColors {
  const AppColors._();

  static const Color background = Color(0xFFFAF5ED);

  /// Preparing card fill — Beta/Secondary/Vanilla-Milk-Foam V-M2.
  static const Color preparingBackground = Color(0xFFFAF5ED);

  /// Ready card fill — Beta/Primery/Blue B6-Primery.
  static const Color readyBackground = Color(0xFF05334A);

  /// Preparing card's 24px outer border, painted as the two exact layers
  /// Figma lists (opaque base, then a translucent tint on top) rather than a
  /// pre-blended approximation — see PreparingSection for the stacking.
  static const Color preparingSectionBorderBase = Color(0xFFFAF5ED);
  static const Color preparingSectionBorderTint = Color(0x0DA37B42);

  /// Ready card's 24px outer border — beta/primery/blue-b-660, translucent
  /// so the background image shows through at the card's edge.
  static const Color readySectionBorder = Color(0x9905334A);

  static const Color navy = Color(0xFF123047);
  static const Color navyDark = Color(0xFF0D2436);

  static const Color chipWhite = Color(0xFFFFFFFF);

  /// Preparing chip border + gauge track — Beta/Secondary/Vanilla-Milk-Foam
  /// V-M3.
  static const Color chipProgressTrack = Color(0xFFF0EAE3);
  static const Color chipProgressFill = Color(0xFFE2CBAF);

  /// Preparing chip order-no text — Beta/Black/Black100.
  static const Color chipNumberColor = Color(0xFF1A1C1E);

  /// Preparing chip cup-count text — Beta/Black/Black58.
  static const Color chipCountColor = Color(0x941A1C1E);

  /// Ready chip default fill — beta/white/white-12 (translucent, tints with
  /// the navy card behind it).
  static const Color chipReadyBase = Color(0x1FFFFFFF);

  /// Ready chip overdue fill — Beta/Accent/Raspberry R6.
  static const Color chipReadyOverdue = Color(0xFFE93C3C);

  /// Ready chip border — same navy as the card background, both states.
  static const Color chipReadyBorder = Color(0xFF05334A);

  /// Ready chip gauge footer — beta/white/white-50, always fully filled
  /// (Ready orders are already done, so there's no partial-progress split).
  static const Color chipReadyFooter = Color(0x80FFFFFF);

  /// READY label text — Beta/Secondary/Vanilla-Milk-Foam V-M3.
  static const Color readyLabelColor = Color(0xFFF0EAE3);

  /// Beta/Secondary/Vanilla V3-Primery.
  static const Color statusBarBackground = Color(0xFFFFF8EF);

  /// Status bar order-no — Beta/Primery/Blue B5.
  static const Color statusOrderCodeColor = Color(0xFF235973);

  /// Status bar 2-line message — Beta/Grey/Gg.
  static const Color statusText = Color(0xFF5C646C);

  /// Pickup-overlay circle fill — Beta/Secondary/Vanilla V3-Primery (same as
  /// the status bar).
  static const Color overlayBackground = Color(0xFFFFF8EF);

  /// Pickup-overlay circle border — Beta/Black/Black12.
  static const Color overlayBorder = Color(0x1F1A1C1E);

  /// Pickup-overlay "Order No." label — Beta/Grey/Gg (same as the status
  /// bar message).
  static const Color overlayLabelColor = Color(0xFF5C646C);

  /// Pickup-overlay order-no — Beta/Primery/Blue B6-Primery (same as the
  /// Ready card fill).
  static const Color overlayOrderNoColor = Color(0xFF05334A);

  /// Pickup-overlay subtitle — Beta/Grey/G7.
  static const Color overlaySubtitleColor = Color(0xFF33383C);

  /// Scrim behind the pickup-complete circle — beta/black-dim/dim-black-30.
  static const Color pickupDimBackground = Color(0x4D1A1C1E);

  // Preparing/Ready card shadows — Black/Black12 + Black/Black38.
  static const Color sectionShadowAmbient = Color(0x1F000000);
  static const Color sectionShadowDrop = Color(0x61000000);

  // Status bar shadows — exact #0000001A / #0000000D from Figma.
  static const Color statusBarShadowAmbient = Color(0x1A000000);
  static const Color statusBarShadowDrop = Color(0x0D000000);
}
