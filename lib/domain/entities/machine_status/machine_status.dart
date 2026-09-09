import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine_status.freezed.dart';

/// Drives the bottom status bar — which machine is active and what it's
/// currently doing.
///
/// [skuNo]/[temp]/[totalCups]/[seq] describe the drink currently being made
/// (FlowHub sends these alongside the status message); [skuNo] is the key
/// used to look up its thumbnail image via [MenuImageRepository].
@freezed
abstract class MachineStatus with _$MachineStatus {
  const factory MachineStatus({
    required String machineOrderNo,
    required String message,
    String? skuNo,
    String? temp,
    int? totalCups,
    int? seq,
    // Raw language code ("en"/"ja"/"ko"/"zh") this message was resolved in —
    // see AppFonts.fontFamilyForLanguage, used by StatusBar to pick the
    // right font for [message].
    @Default('') String lang,
  }) = _MachineStatus;
}
