// ignore_for_file: public_member_api_docs, sort_constructors_first
class GuestInfo {
  final int adults;
  final int children;
  final int babies;

  GuestInfo({this.adults = 1, this.children = 0, this.babies = 0});

  int get totalGuests => adults + children;

  GuestInfo copyWith({int? adults, int? children, int? babies}) {
    return GuestInfo(
      adults: adults ?? this.adults,
      children: children ?? this.children,
      babies: babies ?? this.babies,
    );
  }
}
