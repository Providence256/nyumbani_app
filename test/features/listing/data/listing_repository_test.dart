import 'package:flutter_test/flutter_test.dart';
import 'package:nyumbani_app/features/listing/data/listing_repository.dart';
import 'package:nyumbani_app/utils/constants/data/test_listing.dart';

void main() {
  test('fetchListings return a list of listings', () async {
    final listingRepository = ListingRepository();
    expect(await listingRepository.fetchListings(), kTestListing);
  });

  test('getListing(list1) return first listing', () {
    final listingRepository = ListingRepository();
    expect(listingRepository.getListing('list1'), kTestListing[0]);
  });

  test('watchListing(list1) emits first listing', () {
    final listingRepository = ListingRepository();

    expect(listingRepository.watchListing('list1'), emits(kTestListing[0]));
  });
}
