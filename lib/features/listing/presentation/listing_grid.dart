import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/async_value_widget.dart';
import 'package:nyumbani_app/common/custom_layout_grid.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/features/listing/presentation/listing_list/listing_card.dart';
import 'package:nyumbani_app/routing/app_router.dart';

class ListingGrid extends ConsumerWidget {
  const ListingGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsListValue = ref.watch(watchListingsListProvider);
    return AsyncValueWidget(
      value: listingsListValue,
      data: (listings) => listings.isEmpty
          ? Center(child: Text('no data found'))
          : CustomLayoutGrid(
              maxValue: 1,
              itemCount: listings.length,
              itemBuilder: (_, index) {
                final listing = listings[index];
                return ListingCard(
                  listing: listing,
                  onPressed: () => context.goNamed(
                    AppRoute.listing.name,
                    pathParameters: {'id': listing.id},
                  ),
                );
              },
            ),
    );
  }
}
