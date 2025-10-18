// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/guest_info.dart';

class BookingState {
  final DateRange dateRange;
  final GuestInfo guestInfo;
  final String? listingId;

  BookingState({
    required this.dateRange,
    required this.guestInfo,
    this.listingId,
  });

  BookingState copyWith({
    DateRange? dateRange,
    GuestInfo? guestInfo,
    String? listingId,
  }) {
    return BookingState(
      dateRange: dateRange ?? this.dateRange,
      guestInfo: guestInfo ?? this.guestInfo,
      listingId: listingId ?? this.listingId,
    );
  }
}
