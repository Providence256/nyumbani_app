import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/wishlists/data/remote/fake_remote_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/domain/wishlist.dart';

abstract class RemoteWishlistRepository {
  Future<Wishlist> fetchWishlist(String uid);
  Stream<Wishlist> watchWishlist(String uid);
  Future<void> setWishlist(String uid, Wishlist wishlist);
}

final remoteWishlistRepositoryProvider = Provider<RemoteWishlistRepository>((
  ref,
) {
  // TODO: replace with "real" remote wishlist repository
  return FakeRemoteWishlistRepository();
});
