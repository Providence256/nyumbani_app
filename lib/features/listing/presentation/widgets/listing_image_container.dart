import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class ListingImageContainer extends StatelessWidget {
  const ListingImageContainer({
    super.key,
    required this.imageUrl,
    this.height = 280,
  });
  final String imageUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.p20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.p20),
          bottom: Radius.circular(AppSizes.p20),
        ),
        child: CustomImage(imageUrl: imageUrl),
      ),
    );
  }
}
