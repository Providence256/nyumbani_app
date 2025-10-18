import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_layout_grid.dart';
import 'package:nyumbani_app/features/wishlists/presentation/widgets/wishlist_card.dart';
import 'package:nyumbani_app/utils/constants/data/test_listing.dart';

class WishlistGrid extends StatelessWidget {
  const WishlistGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final listings = kTestListing;
    return listings.isEmpty
        ? Center(child: Text('No listing found'))
        : CustomLayoutGrid(
            maxValue: 2,
            itemCount: listings.length,
            itemBuilder: (_, index) {
              final listing = listings[index];
              return WishlistCard(listing: listing);
            },
          );
  }
}
