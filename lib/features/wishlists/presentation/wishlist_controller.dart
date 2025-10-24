import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/wishlists/application/wishlist_service.dart';

class WishlistController extends StateNotifier<AsyncValue<List<String>>> {
  WishlistController({required this.wishlistService}) : super(AsyncData([]));

  final WishlistService wishlistService;

  Future<void> toggleItem(String listingId) async {
    state = AsyncLoading<List<String>>().copyWithPrevious(state);
    final value = await AsyncValue.guard(
      () => wishlistService.setItem(listingId),
    );

    if (value.hasError) {
      state = AsyncError(value.error!, StackTrace.current);
    } else {
      state = AsyncData([]);
    }
  }
}

final wishlistControllerProvider =
    StateNotifierProvider.autoDispose<WishlistController, AsyncValue>((ref) {
      return WishlistController(
        wishlistService: ref.watch(wishlistServiceProvider),
      );
    });
