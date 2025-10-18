import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/responsive_center.dart';
import 'package:nyumbani_app/features/wishlists/presentation/widgets/wishlist_grid.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class WishlistsScreen extends StatelessWidget {
  const WishlistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favoris',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ResponsiveSliderCenter(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.p20),
            child: WishlistGrid(),
          ),
        ],
      ),
    );
  }
}
