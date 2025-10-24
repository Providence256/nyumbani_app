import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/modal_header.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_state_notifier.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class PriceModal extends ConsumerWidget {
  const PriceModal({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingState = ref.watch(bookingNotifierProvider);
    final dateRange = bookingState.dateRange;

    final nights = HelperFunctions.calculateNights(
      dateRange.checkInDate,
      dateRange.checkOutDate,
    );

    final totalPrice = calculateTotalNight(dateRange, listing.price);
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
                      '$nights Nights x \$${listing.price}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
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
                      '\$${totalPrice.toStringAsFixed(2)}',
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

  double calculateTotalNight(DateRange dateRange, double price) {
    final nights = HelperFunctions.calculateNights(
      dateRange.checkInDate,
      dateRange.checkOutDate,
    );

    final totalPrice = price * nights;

    return totalPrice;
  }
}
