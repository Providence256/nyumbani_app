import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/common/async_value_widget.dart';
import 'package:nyumbani_app/common/custom_layout_grid.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/features/wishlists/application/wishlist_service.dart';
import 'package:nyumbani_app/features/wishlists/domain/wishlist.dart';
import 'package:nyumbani_app/features/wishlists/presentation/widgets/wishlist_card.dart';

class WishlistGrid extends ConsumerWidget {
  const WishlistGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistValue = ref.watch(wishlistProvider);

    return AsyncValueWidget(
      value: wishlistValue,
      data: (wishlists) {
        final items = wishlists.toItemsList();
        return items.isEmpty
            ? Center(child: Text('No listing found'))
            : CustomLayoutGrid(
                maxValue: 2,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  final listing = ref.watch(watchListingProvider(item)).value;
                  return listing == null
                      ? SizedBox.shrink()
                      : WishlistCard(listing: listing);
                },
              );
      },
    );
  }
}
