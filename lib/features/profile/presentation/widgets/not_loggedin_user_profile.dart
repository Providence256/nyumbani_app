import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/features/profile/presentation/widgets/profile_list_title.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotLoggedInUserProfile extends StatelessWidget {
  const NotLoggedInUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizes.p16,
        children: [
          Text(
            'Connectez-vous et vivez l’expérience Nyumbani, tout simplement',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.textSecondaryLight,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.p10),
                ),
              ),
              onPressed: () => context.goNamed(AppRoute.authentication.name),
              child: Text(
                'Se connecter',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontSize: AppSizes.p16,
                ),
              ),
            ),
          ),

          CustomDivider(),

          ProfileListTile(
            title: 'Préférences de l\'appareil',
            icon: PhosphorIcons.gearSix(),
            onTap: () => context.goNamed(AppRoute.devicePreference.name),
          ),
        ],
      ),
    );
  }
}
