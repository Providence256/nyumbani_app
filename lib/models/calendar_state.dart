import 'package:flutter/foundation.dart';

class CalendarState {
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final Set<DateTime>? unvailableDates;

  CalendarState({
    this.checkInDate,
    this.checkOutDate,
    this.unvailableDates = const {},
  });

  bool get isComplete => checkInDate != null && checkOutDate != null;

  CalendarState copyWith({
    DateTime? checkInDate,
    DateTime? checkOutDate,
    Set<DateTime>? unvailableDates,
  }) {
    return CalendarState(
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      unvailableDates: unvailableDates ?? this.unvailableDates,
    );
  }

  @override
  bool operator ==(covariant CalendarState other) {
    if (identical(this, other)) return true;

    return other.checkInDate == checkInDate &&
        other.checkOutDate == checkOutDate &&
        setEquals(other.unvailableDates, unvailableDates);
  }

  @override
  int get hashCode =>
      checkInDate.hashCode ^ checkOutDate.hashCode ^ unvailableDates.hashCode;
}
