import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.p12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textSecondaryDark),
        borderRadius: BorderRadius.circular(AppSizes.p10),
      ),
      child: child,
    );
  }
}
