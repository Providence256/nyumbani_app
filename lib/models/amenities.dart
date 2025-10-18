class Amenities {
  final String id;
  final String name;
  final String iconName;
  final AmenityCategory category;

  const Amenities({
    required this.id,
    required this.name,
    required this.iconName,
    required this.category,
  });
}

enum AmenityCategory {
  essentiels,
  cuisine,
  securite,
  divertissement,
  exterieur,
  accessibilite,
}
