import 'package:flutter/material.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListingValue extends StatelessWidget {
  const ListingValue({super.key, required this.listing});
  final Listing listing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 15,
            children: [
              Expanded(
                child: Text(
                  listing.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                '\$ ${listing.price}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ],
          ),

          Text(
            listing.description,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.textSecondaryLight,
              height: 1.4,
            ),
          ),
          SizedBox(height: AppSizes.p8 * 2),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                AmenityRow(
                  icon: PhosphorIcons.bed(),
                  text: '${listing.bedRooms}',
                ),
                AmenityRow(
                  icon: PhosphorIcons.bathtub(),
                  text: '${listing.bathRooms}',
                ),
                AmenityRow(
                  icon: PhosphorIcons.users(),
                  text: '${listing.maxGuest}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
