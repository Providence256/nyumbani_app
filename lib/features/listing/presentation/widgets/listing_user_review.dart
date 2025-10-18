import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class UserReviewComment extends StatelessWidget {
  const UserReviewComment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: ClipOval(
                  child: CustomImage(
                    imageUrl: 'assets/images/listing/maison2.jpg',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gloire', style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    '5 Months on Nyumbani',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 10,
                );
              }),
              SizedBox(width: 10),
              Text(
                'Septembre 2025',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Super séjour ! Le logement était propre, confortable et conforme à la description. L'hôte était très réactif et serviable. Je reviendrais volontiers.",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
