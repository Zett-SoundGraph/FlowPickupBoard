/// Fixed size tiers for a Preparing chip, keyed independently by column
/// count (width) and row count (height/typography/footer style) — these are
/// hand-tuned Figma values, not a continuous scale, so they're hardcoded
/// rather than interpolated.
enum ChipRowTier { compact, four, five }

class ChipMetrics {
  const ChipMetrics._();

  /// Figma lists 385/308/255 for 4/5/6 columns, but those are rounded
  /// display values — summing the rounded 308 or 255 across a full row
  /// overshoots the 1600px canvas by a few px. Deriving the exact width from
  /// the canvas/padding/gap instead keeps every row pixel-exact (still
  /// ~385/307.2/255.3, just not pre-rounded).
  static double widthForColumns(int columns) {
    const canvasWidth = 1600.0;
    const horizontalPadding = 24.0 + 24.0;
    const columnGap = 4.0;
    final totalGap = (columns - 1) * columnGap;
    return (canvasWidth - horizontalPadding - totalGap) / columns;
  }

  static ChipRowTier tierForRows(int rows) {
    if (rows <= 3) return ChipRowTier.compact;
    if (rows == 4) return ChipRowTier.four;
    return ChipRowTier.five;
  }

  static double heightForTier(ChipRowTier tier) {
    switch (tier) {
      case ChipRowTier.compact:
        return 190;
      case ChipRowTier.four:
        return 153;
      case ChipRowTier.five:
        return 121.8;
    }
  }

  static double numberFontSizeForTier(ChipRowTier tier) {
    switch (tier) {
      case ChipRowTier.compact:
        return 56;
      case ChipRowTier.four:
        return 54;
      case ChipRowTier.five:
        return 48;
    }
  }

  static double numberTopMarginForTier(ChipRowTier tier) {
    switch (tier) {
      case ChipRowTier.compact:
        return 32;
      case ChipRowTier.four:
        return 19;
      case ChipRowTier.five:
        return 16;
    }
  }

  /// Rows 1–3 and 4 show the icon+count gauge footer; row 5 replaces it with
  /// a thin progress bar instead (see variation-6x5.png).
  static bool hasGaugeFooter(ChipRowTier tier) => tier != ChipRowTier.five;
}
