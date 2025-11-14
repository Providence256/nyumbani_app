// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.listingId == listingId &&
        other.userId == userId &&
        other.checkin == checkin &&
        other.checkout == checkout &&
        other.guestInfo == guestInfo &&
        other.price == price &&
        other.bookingStatus == bookingStatus &&
        other.bookingDate == bookingDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        listingId.hashCode ^
        userId.hashCode ^
        checkin.hashCode ^
        checkout.hashCode ^
        guestInfo.hashCode ^
        price.hashCode ^
        bookingStatus.hashCode ^
        bookingDate.hashCode;
  }

  Booking copyWith({
    String? id,
    String? listingId,
    String? userId,
    DateTime? checkin,
    DateTime? checkout,
    GuestInfo? guestInfo,
    double? price,
    BookingStatus? bookingStatus,
    DateTime? bookingDate,
  }) {
    return Booking(
      id: id ?? this.id,
      listingId: listingId ?? this.listingId,
      userId: userId ?? this.userId,
      checkin: checkin ?? this.checkin,
      checkout: checkout ?? this.checkout,
      guestInfo: guestInfo ?? this.guestInfo,
      price: price ?? this.price,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      bookingDate: bookingDate ?? this.bookingDate,
    );
  }

  @override
  String toString() {
    return 'Booking(id: $id, listingId: $listingId, userId: $userId, checkin: $checkin, checkout: $checkout, guestInfo: $guestInfo, price: $price, bookingStatus: $bookingStatus, bookingDate: $bookingDate)';
  }
}
