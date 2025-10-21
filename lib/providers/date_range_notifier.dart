import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/models/date_range.dart';

class DateRangeNotifier extends StateNotifier<DateRange> {
  DateRangeNotifier() : super(DateRange());

  void setStartDate(DateTime date) {
    state = state.copyWith(checkInDate: date, checkOutDate: null);
  }

  void setEndDate(DateTime date) {
    if (state.checkInDate == null) return;

    if (date.isBefore(state.checkInDate!)) {
      state = state.copyWith(checkInDate: date, checkOutDate: null);
    } else {
      state = state.copyWith(checkOutDate: date);
    }
  }

  void selectDates(DateTime date) {
    if (state.checkInDate == null) {
      state = state.copyWith(checkInDate: date, checkOutDate: null);
    } else if (state.checkOutDate == null) {
      if (date.isBefore(state.checkInDate!)) {
        state = state.copyWith(checkInDate: date, checkOutDate: null);
      } else {
        state = state.copyWith(
          checkInDate: state.checkInDate,
          checkOutDate: date,
        );
      }
    } else {
      state = state.copyWith(checkInDate: date, checkOutDate: null);
    }
  }
}

final dateRangeProvider =
    StateNotifierProvider.autoDispose<DateRangeNotifier, DateRange>((ref) {
      return DateRangeNotifier();
    });
