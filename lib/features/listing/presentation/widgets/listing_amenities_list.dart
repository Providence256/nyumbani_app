import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ListingAmenitieList extends StatelessWidget {
  const ListingAmenitieList({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ce que cet endroit offre',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listing.amenities.length,
          itemBuilder: (context, index) {
            final amenities = listing.amenities[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    HelperFunctions.getAmenitiesIcon(amenities),
                    color: AppColors.primary,
                  ),
                  Text(
                    amenities.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.goNamed(
                pathParameters: {'id': listing.id},
                AppRoute.listAmenity.name,
              );
            },

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.p10),
              ),
            ),
            child: Text('Voir tous les equipements'),
          ),
        ),
      ],
    );
  }
}
