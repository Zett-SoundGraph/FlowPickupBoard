import 'package:flutter/material.dart';

import 'package:pickup_board/core/utils/index.dart';
import 'package:pickup_board/domain/entities/index.dart';
import 'package:pickup_board/presentation/enums/index.dart';
import 'package:pickup_board/presentation/screens/pickup_board_screen/widgets/order_chip_widget.dart';

/// Lays out chips at their exact Figma pixel size (width by column count,
/// height by row tier) rather than a flex/aspect-ratio grid — a partial last
/// row stays left-aligned instead of stretching to fill the row.
class OrderGrid extends StatelessWidget {
  const OrderGrid({
    super.key,
    required this.orders,
    required this.variant,
  });

  final List<OrderChip> orders;
  final OrderChipVariant variant;

  static const double _rowGap = 4;
  static const double _columnGap = 4;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return const SizedBox.shrink();

    final columns = GridLayout.columnsFor(orders.length);
    final rows = (orders.length / columns).ceil();
    final tier = ChipMetrics.tierForRows(rows);
    final chipWidth = ChipMetrics.widthForColumns(columns);
    final chipHeight = ChipMetrics.heightForTier(tier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var r = 0; r < rows; r++) ...[
          if (r > 0) const SizedBox(height: _rowGap),
          Row(
            children: [
              for (var c = 0; c < columns; c++) ...[
                if (c > 0) const SizedBox(width: _columnGap),
                if (r * columns + c < orders.length)
                  SizedBox(
                    width: chipWidth,
                    height: chipHeight,
                    child: OrderChipWidget(
                      chip: orders[r * columns + c],
                      variant: variant,
                      tier: tier,
                    ),
                  ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
