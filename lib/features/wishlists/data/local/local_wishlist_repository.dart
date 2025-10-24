import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/wishlists/domain/wishlist.dart';

abstract class LocalWishlistRepository {
  Future<Wishlist> fetchWishlist();
  Stream<Wishlist> watchWishlist();
  Future<void> setWishlist(Wishlist wishlist);
}

final localWishlistRepositoryProvider = Provider<LocalWishlistRepository>((
  ref,
) {
  throw UnimplementedError();
});
