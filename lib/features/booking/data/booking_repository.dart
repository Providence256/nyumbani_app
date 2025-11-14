import 'package:nyumbani_app/features/booking/domain/booking.dart';
import 'package:nyumbani_app/utils/in_memory_store.dart';

class BookingRepository {
  final _bookings = InMemoryStore<Map<String, List<Booking>>>({});

  Stream<List<Booking>> watchUserBookings(String userId, {String? listingId}) {
    return _bookings.stream.map((bookingData) {
      final bookingList = bookingData[userId] ?? [];
      bookingList.sort(
        (lhs, rhs) => rhs.bookingDate.compareTo(lhs.bookingDate),
      );
      if (listingId != null) {
        return bookingList
            .where((booking) => booking.listingId == listingId)
            .toList();
      } else {
        return bookingList;
      }
    });
  }

  Future<void> addBooking(String userId, Booking booking) async {
    final value = _bookings.value;
    final userBookings = value[userId] ?? [];
    userBookings.add(booking);
    value[userId] = userBookings;
    _bookings.value = value;
  }
}
