import 'package:flutter/material.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class ListingDescription extends StatelessWidget {
  const ListingDescription({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description :',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          listing.description,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.textHintLight),
        ),
      ],
    );
  }
}
