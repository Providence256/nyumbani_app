import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/booking/domain/booking_state.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/guest_info.dart';
import 'package:nyumbani_app/models/listing.dart';

class BookingStateNotifier extends StateNotifier<BookingState> {
  BookingStateNotifier()
    : super(BookingState(dateRange: DateRange(), guestInfo: GuestInfo()));

  void updateAdults(int value, int maxGuest) {
    final children = state.guestInfo.children;

    final allowedAdults = min(value, maxGuest - children);
    state = state.copyWith(
      guestInfo: state.guestInfo.copyWith(adults: allowedAdults),
    );
  }

  void updateChildren(int value, int maxGuest) {
    final adults = state.guestInfo.adults;

    final allowedChildren = min(value, maxGuest - adults);
    state = state.copyWith(
      guestInfo: state.guestInfo.copyWith(children: allowedChildren),
    );
  }

  void updateInfants(int value) {
    state = state.copyWith(guestInfo: state.guestInfo.copyWith(babies: value));
  }
}

final bookingNotifierProvider =
    StateNotifierProvider.autoDispose<BookingStateNotifier, BookingState>((
      ref,
    ) {
      return BookingStateNotifier();
    });

final availableAdultsProvider = Provider.autoDispose.family<int, Listing>((
  ref,
  listing,
) {
  final children = ref.watch(bookingNotifierProvider).guestInfo.children;

  return min(listing.maxGuest - children, 10);
});

final availableChildrenProvider = Provider.autoDispose.family<int, Listing>((
  ref,
  listing,
) {
  final adults = ref.watch(bookingNotifierProvider).guestInfo.adults;

  return min(listing.maxGuest - adults, 10);
});
