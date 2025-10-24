import 'package:nyumbani_app/features/wishlists/data/remote/remote_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/domain/wishlist.dart';
import 'package:nyumbani_app/utils/in_memory_store.dart';

class FakeRemoteWishlistRepository implements RemoteWishlistRepository {
  final _wishlists = InMemoryStore<Map<String, Wishlist>>({});

  @override
  Future<Wishlist> fetchWishlist(String uid) {
    return Future.value(_wishlists.value[uid] ?? Wishlist());
  }

  @override
  Future<void> setWishlist(String uid, Wishlist wishlist) async {
    final wishlists = _wishlists.value;

    wishlists[uid] = wishlist;
    _wishlists.value = wishlists;
  }

  @override
  Stream<Wishlist> watchWishlist(String uid) {
    return _wishlists.stream.map((data) => data[uid] ?? Wishlist());
  }
}
