/// Exact layout numbers from Figma for the Preparing/Ready background cards
/// and the status bar.
///
/// [sectionMaxHeight] (814) isn't enforced as a hard Flutter constraint —
/// the per-tier chip heights in ChipMetrics were already sized against it,
/// so section height naturally lands close to it at max density without
/// risking an overflow from our own chrome-padding estimate being a few px
/// off Figma's exact text metrics.
class BoardMetrics {
  const BoardMetrics._();

  static const double sectionMaxHeight = 814;
  static const double sectionCornerRadius = 64;
  static const double sectionBottomPadding = 32;

  // 166, not the spec's 168 — trimmed 2px off the status bar's already-loose
  // bottom margin (see StatusBar) so max-density screens (both sections near
  // their 814 ceiling) fit Flutter's exact-pixel layout without overflowing.
  // Confirmed against figmaImage/variation-6x5.png: even the reference
  // render lands ~2px short of the two sections meeting the status bar
  // exactly, so this is recovering slack the design already assumed.
  static const double statusBarHeight = 166;

  // Bottom-bar message queue timing (see PickupBoardCubit) — each queued
  // message slides up into place over [bottomBarSlideDuration], then holds
  // still for at least [bottomBarMinHoldDuration] before the next one (if
  // any is queued) begins its own slide transition. Shared between the
  // cubit's advance timer and the widget's AnimatedSwitcher duration so
  // they can't drift out of sync with each other.
  static const Duration bottomBarSlideDuration = Duration(milliseconds: 500);
  static const Duration bottomBarMinHoldDuration = Duration(seconds: 1);
}
