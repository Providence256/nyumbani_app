import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/features/wishlists/presentation/wishlist_controller.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HeartIconContainer extends ConsumerWidget {
  const HeartIconContainer({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlist = ref.watch(isInWishlistProvider(listing.id));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () async {
          await ref
              .read(wishlistControllerProvider.notifier)
              .toggleItem(listing.id);
        },
        icon: Icon(
          wishlist ? Icons.favorite : Icons.favorite_border,
          size: AppSizes.p32,
          color: wishlist ? Colors.red : AppColors.textSecondaryLight,
        ),
      ),
    );
  }
}

class BackButtonIconContainer extends StatelessWidget {
  const BackButtonIconContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          PhosphorIcons.arrowLeft(),
          size: AppSizes.p24,
          color: AppColors.textSecondaryLight,
        ),
      ),
    );
  }
}
