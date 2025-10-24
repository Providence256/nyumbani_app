import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/booking/domain/booking_state.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/guest_info.dart';
import 'package:nyumbani_app/providers/date_range_notifier.dart';

class BookingStateNotifier extends StateNotifier<BookingState> {
  BookingStateNotifier(this.ref)
    : super(BookingState(dateRange: _defaultDateRange, guestInfo: GuestInfo()));

  final Ref ref;

  static DateRange get _defaultDateRange => DateRange(
    checkInDate: DateTime.now().add(Duration(days: 1)),
    checkOutDate: DateTime.now().add(Duration(days: 4)),
  );

  void updateDateRange(DateRange dateRange) {
    state = state.copyWith(dateRange: dateRange);

    ref.read(dateRangeProvider.notifier).setDateRange(dateRange);
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
