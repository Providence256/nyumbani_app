import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/listing_user_review.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:nyumbani_app/utils/constants/data/test_listing.dart';

class HostProfileModalBottom extends StatelessWidget {
  const HostProfileModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.p20),
              topRight: Radius.circular(AppSizes.p20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.textSecondaryDark.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 5,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'assets/images/listing/maison3.jpg',
                      ),
                    ),
                    Text(
                      'Providence Musaghi',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'davidmusaghi7@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.textSecondaryDark,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Column(
                          children: [
                            Text(
                              '237',
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge!.copyWith(fontSize: 24),
                            ),
                            Text(
                              'Reviews',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              spacing: 3,
                              children: [
                                Text(
                                  '4.9',
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(fontSize: 24),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              'Ratings',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSizes.p8,
                children: [
                  Text(
                    'A Propos',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Bonjour et bienvenue ! Je suis Providence, passionné de voyages et de rencontres. J'aime partager ma ville et ses bonnes adresses avec mes visiteurs. Mon objectif est que vous vous sentiez comme chez vous dès votre arrivée. N'hésitez pas à me contacter pour toute question avant ou pendant votre séjour.",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),

              CustomDivider(),

              //Host Review
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Providence's review",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: AppSizes.p12),
                  UserReviewComment(),
                  SizedBox(height: AppSizes.p8),
                  GestureDetector(
                    onTap: () {},

                    child: Text(
                      'Voir plus de votes',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              CustomDivider(),

              // Host Listing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "Providence's listing",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: kTestListing.length,
                      itemBuilder: (context, index) {
                        final listing = kTestListing[index];
                        return Container(
                          width: 280,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  listing.images.first,
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //Listing Details
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listing.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${listing.rating} rating',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${listing.reviewCouting} reviews',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color:
                                                    AppColors.textSecondaryDark,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      '\$${listing.price}/Night',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: AppColors.primary),
                                    ),
                                  ],
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
              CustomDivider(),
              ListTile(
                onTap: () {},
                title: Text(
                  'Signaler Providence',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                leading: Icon(Icons.flag_outlined),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
