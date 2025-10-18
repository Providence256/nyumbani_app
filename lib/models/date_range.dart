// ignore_for_file: public_member_api_docs, sort_constructors_first
class DateRange {
  final DateTime? checkInDate;
  final DateTime? checkOutDate;

  DateRange({this.checkInDate, this.checkOutDate});

  DateRange copyWith({DateTime? checkInDate, DateTime? checkOutDate}) {
    return DateRange(checkInDate: checkInDate, checkOutDate: checkOutDate);
  }

  @override
  bool operator ==(covariant DateRange other) {
    if (identical(this, other)) return true;

    return other.checkInDate == checkInDate &&
        other.checkOutDate == checkOutDate;
  }

  @override
  int get hashCode => checkInDate.hashCode ^ checkOutDate.hashCode;
}
