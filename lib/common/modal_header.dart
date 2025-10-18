import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.textSecondaryDark)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
