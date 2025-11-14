import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/common/error_message_widget.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_state_notifier.dart';
import 'package:nyumbani_app/features/booking/presentation/widgets/guest_info_modal.dart';
import 'package:nyumbani_app/features/booking/presentation/widgets/price_modal.dart';
import 'package:nyumbani_app/features/home/presentation/widgets/calendar_widget.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/helpers/helper_functions.dart';
import 'package:nyumbani_app/models/calendar_mode.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BookingReviewScreen extends ConsumerWidget {
  const BookingReviewScreen({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingValue = ref.watch(watchListingProvider(listingId));
    final bookingstate = ref.watch(bookingNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Revoir et continuer',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: listingValue.when(
        data: (listing) {
          return listing == null
              ? Text('No Data found')
              : SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.textSecondaryLight.withValues(
                                alpha: 0.3,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CustomImage(
                                        imageUrl: listing.images[0],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      listing.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                              CustomDivider(),
                              BookingReviewDetail(
                                title: 'Dates',
                                subtible:
                                    '${HelperFunctions.formatDay(bookingstate.dateRange.checkInDate ?? DateTime.now())} - ${HelperFunctions.formatFullDate(bookingstate.dateRange.checkOutDate ?? DateTime.now().add(Duration(days: 2)))}',
                                buttonText: 'Changer',
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (_) => CalendarWidget(
                                      mode: CalendarMode.booking,
                                    ),
                                  );
                                },
                              ),
                              CustomDivider(),
                              BookingReviewDetail(
                                title: 'Visiteurs',
                                subtible: HelperFunctions.getGuestSummary(
                                  bookingstate.guestInfo,
                                ),
                                buttonText: 'Changer',
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (_) =>
                                        GuestInfoModal(listing: listing),
                                  );
                                },
                              ),
                              CustomDivider(),
                              BookingReviewDetail(
                                title: 'Prix Total',
                                subtible: '\$${listing.price}',
                                buttonText: 'Details',
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) =>
                                        PriceModal(listing: listing),
                                  );
                                },
                              ),
                              CustomDivider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Aucun prépaiement requis - payez sur place',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
        error: (e, st) => ErrorMessageWidget(errorMessage: e.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 5),
              color: Theme.of(context).colorScheme.onPrimaryFixed,
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            context.goNamed(
              pathParameters: {'id': listingId},
              AppRoute.checkout.name,
            );
          },
          icon: Icon(PhosphorIcons.arrowRight()),
          label: Text('Suivant'),
        ),
      ),
    );
  }
}

class BookingReviewDetail extends StatelessWidget {
  const BookingReviewDetail({
    super.key,
    required this.title,
    required this.subtible,
    required this.buttonText,
    required this.onTap,
  });

  final String title;
  final String subtible;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              subtible,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.textSecondaryLight.withValues(
              alpha: 0.1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onTap,
          child: Text(
            buttonText,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
