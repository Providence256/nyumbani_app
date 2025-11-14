import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/alert_dialog.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/common/shadow_container_widget.dart';
import 'package:nyumbani_app/features/authentication/presentation/email_login_controller.dart';
import 'package:nyumbani_app/features/profile/presentation/widgets/profile_list_title.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoggedInUserProfile extends ConsumerWidget {
  const LoggedInUserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emailLoginControllerProvider);
    return SingleChildScrollView(
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
                  'Providence Musaghi',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
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
                          "Commencer à héberger et gagner un revenu supplémentaire.",
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
          ProfileListTile(title: 'Mes Avis', icon: PhosphorIcons.chatCircle()),
          SizedBox(height: AppSizes.p24),
          ProfileListTile(
            title: 'Visualiser vos annonces',
            icon: PhosphorIcons.building(),
          ),
          SizedBox(height: AppSizes.p20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.p10),
                  side: BorderSide(color: AppColors.textSecondaryDark),
                ),
              ),
              onPressed: state.isLoading
                  ? null
                  : () async {
                      final logout = await showAlertDialog(
                        context: context,
                        title: 'Etes vous sur de vouloir vous déconnecter?',
                        cancelActionText: 'Quitter',
                        defaultActionText: 'Déconnecter',
                      );

                      if (logout == true) {
                        await ref
                            .read(emailLoginControllerProvider.notifier)
                            .signOut();
                      }
                    },
              icon: Icon(
                PhosphorIcons.signOut(),
                size: AppSizes.p24,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                'Se Déconnecter',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
