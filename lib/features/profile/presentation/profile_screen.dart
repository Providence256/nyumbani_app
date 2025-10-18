import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/border_container_widget.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/common/shadow_container_widget.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(PhosphorIcons.bell())),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p20),
        child: Column(
          children: [
            ShadowContainerWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: AppSizes.p64,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'assets/images/listing/maison1.jpg',
                    ),
                  ),
                  Text(
                    'Providence',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.p16),
            ShadowContainerWidget(
              child: Row(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Devenir Hote',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          child: Text(
                            "Il est facile de commencer à héberger et de gagner un revenu supplémentaire.",
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: AppColors.textSecondaryLight),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.p24),
            ProfileListTile(
              title: 'Informations personnelles',
              icon: PhosphorIcons.user(),
              onTap: () => context.goNamed(AppRoute.personnalInfo.name),
            ),
            SizedBox(height: AppSizes.p24),
            ProfileListTile(
              title: 'Préférences de l\'appareil',
              icon: PhosphorIcons.gearSix(),
              onTap: () => context.goNamed(AppRoute.devicePreference.name),
            ),
            SizedBox(height: AppSizes.p24),
            ProfileListTile(
              title: 'Mes Avis',
              icon: PhosphorIcons.chatCircle(),
            ),
            SizedBox(height: AppSizes.p20),
            BorderContainerWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(
                    PhosphorIcons.signOut(),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    'Se Déconnecter',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.onSurface),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: AppSizes.p16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
