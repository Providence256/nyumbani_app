import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/error_message_widget.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ListingAmenityScreen extends ConsumerWidget {
  const ListingAmenityScreen({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingValue = ref.watch(watchListingProvider(listingId));

    return Scaffold(
      appBar: AppBar(),
      body: listingValue.when(
        data: (listing) {
          final amenitiesGroupedBycategory = groupBy(
            listing!.amenities,
            (amenity) => amenity.category,
          );
          return SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Equipements',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                ...amenitiesGroupedBycategory.entries.map((entry) {
                  final category = entry.key;
                  final amenities = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          HelperFunctions.categoryLabel(category),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: amenities.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final amenity = amenities[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      HelperFunctions.getAmenitiesIcon(amenity),
                                      color: AppColors.primary,
                                    ),
                                    Text(
                                      amenity.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              CustomDivider(),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        },
        error: (e, st) => ErrorMessageWidget(errorMessage: e.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
