import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/responsive_center.dart';
import 'package:nyumbani_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:nyumbani_app/features/home/presentation/widgets/home_search_container.dart';
import 'package:nyumbani_app/features/home/presentation/widgets/menu_filter_tab.dart';
import 'package:nyumbani_app/features/listing/presentation/listing_grid.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ResponsiveSliderCenter(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.p20,
                vertical: AppSizes.p16,
              ),
              child: HomeSearchContainer(),
            ),

            ResponsiveSliderCenter(
              padding: EdgeInsets.symmetric(vertical: AppSizes.p4),
              child: MenuFilterTab(),
            ),
            // Property card
            ResponsiveSliderCenter(
              padding: EdgeInsets.all(AppSizes.p20),
              child: ListingGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class AmenityRow extends StatelessWidget {
  const AmenityRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p10,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.textSecondaryDark.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.p20),
      ),
      child: Row(
        spacing: 4,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.textSecondaryLight,
            ),
          ),
          Icon(
            icon,
            size: 18,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ],
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  const FilterTab({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p20,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppSizes.p20),
        border: Border.all(color: AppColors.dividerLight),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
