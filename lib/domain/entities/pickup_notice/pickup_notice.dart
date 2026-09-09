import 'package:freezed_annotation/freezed_annotation.dart';

part 'pickup_notice.freezed.dart';

/// Transient "your order is ready" overlay shown right after an order moves
/// from Preparing into Ready.
@freezed
abstract class PickupNotice with _$PickupNotice {
  const factory PickupNotice({
    required String orderNo,
    // Raw language code ("en"/"ja"/"ko"/"zh") FlowHub sent for this order —
    // the actual localized message text is resolved separately (see
    // GetTranslationUsecase / PickupBoardState.pickupNoticeMessage), not
    // stored here.
    @Default('') String lang,
  }) = _PickupNotice;
}
