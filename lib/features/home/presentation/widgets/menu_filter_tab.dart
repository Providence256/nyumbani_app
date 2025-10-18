import 'package:flutter/material.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class MenuFilterTab extends StatelessWidget {
  const MenuFilterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p20),

      child: Row(
        spacing: AppSizes.p8,
        children: [
          FilterTab(label: 'Best Offer'),
          FilterTab(label: 'Top Rates'),
          FilterTab(label: 'Popular'),
          FilterTab(label: 'Nearby'),
        ],
      ),
    );
  }
}
