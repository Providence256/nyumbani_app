import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class CustomLayoutGrid extends StatelessWidget {
  const CustomLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.maxValue,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final int maxValue;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = max(maxValue, width ~/ 250);
        final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
        final numRows = (itemCount / crossAxisCount).ceil();
        final rowSizes = List.generate(numRows, (_) => auto);

        return LayoutGrid(
          columnSizes: columnSizes,
          rowSizes: rowSizes,
          rowGap: AppSizes.p16,
          columnGap: AppSizes.p12,
          children: [
            for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
          ],
        );
      },
    );
  }
}
