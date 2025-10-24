import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/heart_icon_container.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_image_container.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class WishlistCard extends StatefulWidget {
  const WishlistCard({super.key, required this.listing});
  final Listing listing;

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.p20),
        ),
        child: Column(
          spacing: AppSizes.p10,
          children: [
            Stack(
              children: [
                ListingImageContainer(
                  height: 150,
                  imageUrl: widget.listing.images[0],
                ),
                Positioned(
                  top: AppSizes.p16,
                  right: AppSizes.p16,
                  child: HeartIconContainer(listing: widget.listing),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  widget.listing.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      '\$${widget.listing.price}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                    Row(
                      spacing: 3,
                      children: [
                        Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 12,
                        ),
                        Text(
                          '${widget.listing.rating}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
