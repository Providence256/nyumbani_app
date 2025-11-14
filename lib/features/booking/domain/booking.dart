import 'package:nyumbani_app/models/guest_info.dart';

enum BookingStatus { confirmed, cancelled, processing }

class Booking {
  Booking({
    required this.id,
    required this.listingId,
    required this.userId,
    required this.checkin,
    required this.checkout,
    required this.guestInfo,
    required this.price,
    required this.bookingStatus,
    required this.bookingDate,
  });

  final String id;
  final String listingId;
  final String userId;
  final DateTime checkin;
  final DateTime checkout;
  final GuestInfo guestInfo;
  final double price;
  final BookingStatus bookingStatus;
  final DateTime bookingDate;
}
