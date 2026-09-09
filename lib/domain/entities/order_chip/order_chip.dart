import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_chip.freezed.dart';

/// A single order pill shown in either the Preparing or Ready grid.
@freezed
abstract class OrderChip with _$OrderChip {
  const factory OrderChip({
    required String orderNo,
    required int cupCount,
    /// 0.0–1.0 brew progress shown in the Preparing gauge footer.
    required double progress,
    /// Ready-section only: true once an order has sat past FlowHub's
    /// elapsed-time threshold, rendered in the red "overdue" fill instead of
    /// the default translucent one.
    @Default(false) bool isOverdue,
  }) = _OrderChip;
}
