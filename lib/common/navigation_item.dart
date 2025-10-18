import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    required this.activeIcon,
  });

  final IconData icon;
  final String label;
  final IconData activeIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isActive = index == 0;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.p8),
        child: Column(
          spacing: AppSizes.p4,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? AppColors.primary : AppColors.textPrimaryLight,
            ),
            Text(label, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
