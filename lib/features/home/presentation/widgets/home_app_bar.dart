import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      automaticallyImplyLeading: false,
      title: Row(
        spacing: 10,
        children: [
          Container(
            width: AppSizes.p48,
            height: AppSizes.p48,
            decoration: BoxDecoration(
              color: AppColors.cardLight,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.dividerLight, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/listing/maison1.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.white,
                    child: Icon(
                      PhosphorIcons.user(),
                      size: 24,
                      color: AppColors.textHintLight,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Providence',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Welcom back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            PhosphorIcons.bell(),
            color: AppColors.textSecondaryLight,
            size: AppSizes.p24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
