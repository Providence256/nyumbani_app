import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/common/responsive_center.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
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
                  FilterTab(label: 'Tout'),
                  FilterTab(label: 'Non lus'),
                ],
              ),
            ),
          ),
          ResponsiveSliderCenter(child: SizedBox(height: AppSizes.p12)),
          ResponsiveSliderCenter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        context.goNamed(AppRoute.chatMessage.name);
                      },
                      leading: CircleAvatar(
                        radius: AppSizes.p24,
                        backgroundImage: AssetImage(
                          'assets/images/listing/maison1.jpg',
                        ),
                      ),
                      title: Text(
                        'Gloire Bwami',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        'Bonjour cher Mr, je vous ai ecris mais pas des reponse',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.textSecondaryLight,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: AppSizes.p10,
                              children: [
                                Text(
                                  '13:25',
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(
                                        color: AppColors.textSecondaryDark,
                                      ),
                                ),
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.p24),
                      child: CustomDivider(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
