import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  final int index;
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p20),
      child: Column(
        spacing: AppSizes.p24,
        children: [
          SizedBox(height: AppSizes.p12),

          // Image Container
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.p24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowLight,
                    blurRadius: AppSizes.p20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.p24),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.cardLight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Icon(
                            Icons.home_filled,
                            size: 80,
                            color: AppColors.primary.withValues(alpha: 0.3),
                          ),
                          Text(
                            'Luxury Interior',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Text Content
          Expanded(
            child: Column(
              spacing: AppSizes.p8,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.textHintLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
