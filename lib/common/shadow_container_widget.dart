import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ShadowContainerWidget extends StatelessWidget {
  const ShadowContainerWidget({
    super.key,
    required this.child,
    this.margin = EdgeInsets.zero,
  });

  final Widget child;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.p16),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(AppSizes.p12),
      ),
      child: child,
    );
  }
}
