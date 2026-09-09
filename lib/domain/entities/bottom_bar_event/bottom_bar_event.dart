import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_bar_event.freezed.dart';

/// One raw, untranslated bottom-bar-worthy event detected by
/// [MqttBoardDataSource] (order received / a sub-item's ProductionStage
/// changed / order picked up) — carries just enough data for
/// [PickupBoardCubit] to look up [languageId]'s template (Language List
/// sheet) and fill in its placeholder tokens ("[Order Number]", "[Menu
/// Name]", "[Dispenser]", "[Coffee Machine]") without needing any
/// translation/formatting logic in the data source itself.
@freezed
abstract class BottomBarRawEvent with _$BottomBarRawEvent {
  const factory BottomBarRawEvent({
    required String orderNo,
    required String lang,
    // Language List "Language ID" this event's message template lives
    // under, e.g. "PB.BB.0001".
    required String languageId,
    @Default('') String skuNo,
    @Default(0) int totalCups,
    @Default('') String menuName,
    @Default('') String dispenserName,
  }) = _BottomBarRawEvent;
}
