import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';
import 'package:pickup_board/core/theme/index.dart';
import 'package:pickup_board/domain/entities/index.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
    this.machineStatus,
    this.drinkImageUrl,
    this.eventSeq = 0,
  });

  final MachineStatus? machineStatus;

  /// Resolved via [GetMenuImageUsecase] from [MachineStatus.skuNo] — null
  /// while the sheet hasn't loaded yet, offline, or the SKU has no row.
  final String? drinkImageUrl;

  /// [PickupBoardState.bottomBarEventSeq] — keys the slide transition below
  /// so it always fires on a new message, even if two consecutive ones
  /// happened to render identically.
  final int eventSeq;

  @override
  Widget build(BuildContext context) {
    final status = machineStatus;
    if (status == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      height: BoardMetrics.statusBarHeight,
      decoration: const BoxDecoration(
        color: AppColors.statusBarBackground,
        boxShadow: AppDecorations.statusBarShadow,
      ),
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: BoardMetrics.bottomBarSlideDuration,
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            final childKey = child.key;
            // The entering child slides up from below into place. The
            // exiting child (previous message) should keep sliding up and
            // out of view — but AnimatedSwitcher drives the exiting entry's
            // controller with reverse() (value runs 1->0, not 0->1), while
            // Tween.animate() always maps begin->(t=0) and end->(t=1)
            // regardless of which direction the controller is moving. So the
            // exiting tween's begin/end need to be the mirror of the
            // entering one (begin = final off-screen-top position, end =
            // current center position) to read correctly as the value falls
            // from 1 to 0.
            final isEntering = childKey == ValueKey(eventSeq);
            final offsetTween = isEntering
                ? Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                : Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);
            return SlideTransition(position: offsetTween.animate(animation), child: child);
          },
          // Positioned.fill on every child, not bare Stack children — a
          // Stack's non-positioned children only take their own intrinsic
          // size, which would leave _content's Row with no bounded width to
          // give its Expanded message text (the same class of bug as the
          // pickup_board white-screen issue from earlier this session).
          layoutBuilder: (currentChild, previousChildren) => Stack(
            alignment: Alignment.centerLeft,
            children: [
              for (final child in previousChildren) Positioned.fill(child: child),
              if (currentChild != null) Positioned.fill(child: currentChild),
            ],
          ),
          child: KeyedSubtree(
            key: ValueKey(eventSeq),
            child: _content(status),
          ),
        ),
      ),
    );
  }

  Widget _content(MachineStatus status) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 44),
        Padding(
          padding: const EdgeInsets.only(top: 31),
          child: Text(status.machineOrderNo, style: AppTextStyles.statusOrderCode),
        ),
        const SizedBox(width: 32),
        SizedBox(
          height: BoardMetrics.statusBarHeight,
          child: Center(
            child: _drinkThumbnail(),
          ),
        ),
        const SizedBox(width: 44),
        Expanded(
          child: Padding(
            // bottom: 22, not the spec's 24 — see BoardMetrics.statusBarHeight.
            padding: const EdgeInsets.only(top: 16, right: 80, bottom: 22),
            child: Text(
              status.message,
              style: AppTextStyles.statusMessage.copyWith(
                fontFamily: AppFonts.fontFamilyForLanguage(status.lang),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _drinkThumbnail() {
    final url = drinkImageUrl;
    final placeholder = Image.asset(
      AssetPaths.coffeeIcon,
      width: 108,
      height: 108,
    );
    if (url == null) return placeholder;
    return Image.network(
      url,
      width: 108,
      height: 108,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => placeholder,
    );
  }
}
