import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class PersonnalInfoScreen extends StatelessWidget {
  const PersonnalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info Personnelles',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonnalInfoListTile(
              title: 'Noms',
              subTitle: 'Providence Musaghi',
            ),
            PersonnalInfoListTile(title: 'Genre', subTitle: 'Pas disponible'),
            PersonnalInfoListTile(
              title: 'Date de Naissance',
              subTitle: 'Pas disponible',
            ),
            PersonnalInfoListTile(
              title: 'Details Passport',
              subTitle: 'Pas disponible',
            ),
            PersonnalInfoListTile(
              title: 'Email',
              subTitle: 'davidmusaghi7@gmail.com',
            ),
            PersonnalInfoListTile(
              title: 'Numero Téléphone',
              subTitle: '+243 995 415 641',
            ),
            Text(
              'Les établissements que vous réservez utiliseront ce numéro s\'ils ont besoin de vous contacter. Ce numéro pourra également servir de méthode de connexion alternative en cas de problème avec votre adresse e-mail.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.textSecondaryDark,
                fontSize: 13,
              ),
            ),
            PersonnalInfoListTile(title: 'Adresse', subTitle: 'Pas Disponible'),
          ],
        ),
      ),
    );
  }
}

class PersonnalInfoListTile extends StatelessWidget {
  const PersonnalInfoListTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}
