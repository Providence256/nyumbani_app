import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/modal_header.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class PriceModal extends StatelessWidget {
  const PriceModal({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.p20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModalHeader(title: 'Details de Prix'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.p16,
              vertical: AppSizes.p20,
            ),
            child: Column(
              spacing: AppSizes.p8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '4 Nights x \$${listing.price}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '\$${listing.price}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                CustomDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total USD',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '\$400.00',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
