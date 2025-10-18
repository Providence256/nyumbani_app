import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HeartIconContainer extends StatelessWidget {
  const HeartIconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          print('loved clicked');
        },
        icon: Icon(
          PhosphorIcons.heart(),
          size: AppSizes.p24,
          color: AppColors.textSecondaryLight,
        ),
      ),
    );
  }
}

class BackButtonIconContainer extends StatelessWidget {
  const BackButtonIconContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          PhosphorIcons.arrowLeft(),
          size: AppSizes.p24,
          color: AppColors.textSecondaryLight,
        ),
      ),
    );
  }
}
