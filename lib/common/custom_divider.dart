import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.textSecondaryDark.withValues(alpha: 0.5));
  }
}
