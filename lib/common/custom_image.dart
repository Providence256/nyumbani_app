import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.cardLight,
          child: Icon(
            PhosphorIcons.house(),
            size: 24,
            color: AppColors.textHintLight,
          ),
        );
      },
    );
  }
}
