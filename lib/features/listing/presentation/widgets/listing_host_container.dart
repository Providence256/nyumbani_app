import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_image.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/chat_modal_bottom_sheet.dart';
import 'package:nyumbani_app/features/listing/presentation/widgets/host_profile_modal_bottom.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListingHostContainer extends StatelessWidget {
  const ListingHostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.p64,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textHintLight),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: CustomImage(imageUrl: 'assets/images/listing/maison1.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Providence Musaghi',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text('hôte', style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          RoundIconContainer(
            icon: PhosphorIcons.chatCircleText(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => ChatModalBottomSheet(),
              );
            },
          ),

          RoundIconContainer(
            onPressed: () {
              showModalBottomSheet(
                showDragHandle: true,
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (_) => HostProfileModalBottom(),
              );
            },
            icon: PhosphorIcons.caretRight(),
          ),
        ],
      ),
    );
  }
}

class RoundIconContainer extends StatelessWidget {
  const RoundIconContainer({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.dividerDark),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.primary, size: 18),
      ),
    );
  }
}
