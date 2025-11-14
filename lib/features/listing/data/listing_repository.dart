import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/utils/constants/data/test_listing.dart';

class ListingRepository {
  final List<Listing> _listings = kTestListing;

  Listing? getListing(String id) {
    return _getListing(_listings, id);
  }

  Future<List<Listing>> fetchListings() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(_listings);
  }

  Stream<List<Listing>> watchListingsList() async* {
    await Future.delayed(Duration(seconds: 2));
    yield _listings;
  }

  Stream<Listing?> watchListing(String id) {
    return watchListingsList().map((listings) => _getListing(listings, id));
  }

  static Listing? _getListing(List<Listing> listings, String id) {
    try {
      return listings.firstWhere((listing) => listing.id == id);
    } catch (e) {
      return null;
    }
  }
}

final listingRepositoryProvider = Provider<ListingRepository>((ref) {
  return ListingRepository();
});

final fetchListingProvider = FutureProvider<List<Listing>>((ref) {
  final listingRepository = ref.watch(listingRepositoryProvider);
  return listingRepository.fetchListings();
});

final watchListingsListProvider = StreamProvider<List<Listing>>((ref) {
  final listingRepository = ref.watch(listingRepositoryProvider);

  return listingRepository.watchListingsList();
});

final watchListingProvider = StreamProvider.autoDispose
    .family<Listing?, String>((ref, id) {
      final listingRepository = ref.watch(listingRepositoryProvider);
      return listingRepository.watchListing(id);
    });
