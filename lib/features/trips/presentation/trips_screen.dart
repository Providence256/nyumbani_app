import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/common/responsive_center.dart';
import 'package:nyumbani_app/common/shadow_container_widget.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Réservations',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ResponsiveSliderCenter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.p20),
              child: Row(
                spacing: AppSizes.p8,
                children: [
                  FilterTab(label: 'Actives'),
                  FilterTab(label: 'Passées'),
                  FilterTab(label: 'Annulées'),
                ],
              ),
            ),
          ),

          ResponsiveSliderCenter(
            padding: EdgeInsets.all(AppSizes.p16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ShadowContainerWidget(
                  margin: EdgeInsets.only(bottom: AppSizes.p12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppSizes.p8),
                              child: CustomImage(
                                imageUrl: 'assets/images/listing/maison2.jpg',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3 bedrooms Apartment',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '02 - 05 Oct',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
