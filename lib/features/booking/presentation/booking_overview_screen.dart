import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/border_container_widget.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class BookingOverviewScreen extends StatelessWidget {
  const BookingOverviewScreen({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Aperçu de la réservation',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              BorderContainerWidget(
                child: Column(
                  spacing: AppSizes.p10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3 BedRooms appartment',
                              style: Theme.of(context).textTheme.headlineMedium,
                              maxLines: 3,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '4.9',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'N,27M Avenue Nguma, Quartier Jolie Parc ,Ngaliema',
                          style: Theme.of(context).textTheme.labelLarge,
                          maxLines: 3,
                        ),
                      ],
                    ),

                    CustomDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              'Check-in',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Mon,29 sep 2025',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              'Check-out',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              'Tue,30 sep 2025',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'Visiteurs',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          '4 adultes',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              BorderContainerWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'US\$400.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Text(
                'Conditions de réservation',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              _buildBookingInfo(
                context,
                Icons.refresh,
                'Coût total pour annuler',
              ),
              _buildBookingInfo(
                context,
                Icons.check_circle_outline,
                'Aucun prépaiement nécessaire - payez sur place',
              ),
              CustomDivider(),
              SizedBox(height: 5),
              Text(
                'En cliquant sur Réserver maintenant, vous reconnaissez avoir pris connaissance et accepté la Politique de confidentialité et les Conditions générales de Nyumbani.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSizes.p20),
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
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Réserver maintenant'),
        ),
      ),
    );
  }

  Widget _buildBookingInfo(BuildContext context, IconData icon, String text) {
    return Row(
      spacing: 5,
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
