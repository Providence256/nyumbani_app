import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/heart_icon_container.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_image_container.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_value.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ListingCard extends StatefulWidget {
  const ListingCard({super.key, required this.listing, this.onPressed});

  final Listing listing;
  final VoidCallback? onPressed;

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.p20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                //Image Container
                ListingImageContainer(imageUrl: widget.listing.images[0]),
                Positioned(
                  top: AppSizes.p16,
                  right: AppSizes.p16,
                  child: HeartIconContainer(),
                ),
              ],
            ),

            ListingValue(listing: widget.listing),
          ],
        ),
      ),
    );
  }
}
