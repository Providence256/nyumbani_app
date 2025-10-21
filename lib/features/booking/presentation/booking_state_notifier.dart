import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/booking/domain/booking_state.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/guest_info.dart';
import 'package:nyumbani_app/models/listing.dart';
import 'package:nyumbani_app/providers/date_range_notifier.dart';

class BookingStateNotifier extends StateNotifier<BookingState> {
  BookingStateNotifier(this.ref)
    : super(BookingState(dateRange: DateRange(), guestInfo: GuestInfo()));

  final Ref ref;

  void syncDateRange() {
    final globalDateRange = ref.read(dateRangeProvider);
    state = state.copyWith(dateRange: globalDateRange);
  }

  void updateAdults(int value) {
    state = state.copyWith(guestInfo: state.guestInfo.copyWith(adults: value));
  }

  void updateChildren(int value) {
    state = state.copyWith(
      guestInfo: state.guestInfo.copyWith(children: value),
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
      return BookingStateNotifier(ref);
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
