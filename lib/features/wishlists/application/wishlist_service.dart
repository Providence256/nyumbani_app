import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/authentication/data/auth_repository.dart';
import 'package:nyumbani_app/features/wishlists/data/local/local_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/data/remote/remote_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/domain/mutable_wishlist.dart';
import 'package:nyumbani_app/features/wishlists/domain/wishlist.dart';

class WishlistService {
  WishlistService(this.ref);

  final Ref ref;
  Future<Wishlist> _fetchWishlist() {
    final user = ref.read(authRepositoryProvider).currentUser;

    if (user != null) {
      return ref.read(remoteWishlistRepositoryProvider).fetchWishlist(user.uid);
    } else {
      return ref.read(localWishlistRepositoryProvider).fetchWishlist();
    }
  }

  Stream<Wishlist> watchWishlist() {
    final user = ref.read(authRepositoryProvider).currentUser;

    if (user != null) {
      return ref.read(remoteWishlistRepositoryProvider).watchWishlist(user.uid);
    } else {
      return ref.read(localWishlistRepositoryProvider).watchWishlist();
    }
  }

  Future<void> _setWishlist(Wishlist wishlist) async {
    final user = ref.read(authRepositoryProvider).currentUser;

    if (user != null) {
      await ref
          .read(remoteWishlistRepositoryProvider)
          .setWishlist(user.uid, wishlist);
    } else {
      await ref.read(localWishlistRepositoryProvider).setWishlist(wishlist);
    }
  }

  /// sets an item in the local or remote wishlist depending on the user auth state
  Future<void> setItem(String listingId) async {
    final wishlist = await _fetchWishlist();
    final updated = wishlist.toggleItem(listingId);
    await _setWishlist(updated);
  }
}

final wishlistServiceProvider = Provider<WishlistService>((ref) {
  return WishlistService(ref);
});

final wishlistProvider = StreamProvider<Wishlist>((ref) {
  final wishlistService = ref.watch(wishlistServiceProvider);

  return wishlistService.watchWishlist();
});
