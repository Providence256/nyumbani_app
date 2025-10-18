import 'package:nyumbani_app/models/amenities.dart';

const kTestAmenities = [
  // essentiels
  Amenities(
    id: 'amen1',
    name: 'Wi-Fi',
    category: AmenityCategory.essentiels,
    iconName: "wifi",
  ),
  Amenities(
    id: 'amen2',
    name: 'Climatisation',
    category: AmenityCategory.essentiels,
    iconName: "ac_unit",
  ),
  Amenities(
    id: 'amen3',
    name: 'Chauffage',
    category: AmenityCategory.essentiels,
    iconName: "thermostat",
  ),
  Amenities(
    id: 'amen4',
    name: 'Machine à laver',
    category: AmenityCategory.essentiels,
    iconName: "wash",
  ),
  Amenities(
    id: 'amen5',
    name: 'Sèche-linge',
    category: AmenityCategory.essentiels,
    iconName: "dry",
  ),

  // Cuisine
  Amenities(
    id: 'amen6',
    name: 'Cuisine',
    category: AmenityCategory.cuisine,
    iconName: "cuisine",
  ),
  Amenities(
    id: 'amen7',
    name: 'Réfrigérateur',
    category: AmenityCategory.cuisine,
    iconName: "cuisine_outlined",
  ),
  Amenities(
    id: 'amen8',
    name: 'Micro-ondes',
    category: AmenityCategory.cuisine,
    iconName: "microwave",
  ),
  Amenities(
    id: 'amen9',
    name: 'Cafetière',
    category: AmenityCategory.cuisine,
    iconName: "coffee",
  ),

  // Sécurité
  Amenities(
    id: 'amen10',
    name: 'Détecteur de fumée',
    category: AmenityCategory.securite,
    iconName: "smoke_free",
  ),
  Amenities(
    id: 'amen11',
    name: 'Trousse de premiers secours',
    category: AmenityCategory.securite,
    iconName: "medical_services",
  ),
  Amenities(
    id: 'amen12',
    name: 'Extincteur',
    category: AmenityCategory.securite,
    iconName: "fire_extinguisher",
  ),
  Amenities(
    id: 'amen13',
    name: 'Sécurité',
    category: AmenityCategory.securite,
    iconName: "security",
  ),

  // Divertissement
  Amenities(
    id: 'amen14',
    name: 'TV',
    category: AmenityCategory.divertissement,
    iconName: "tv",
  ),
  Amenities(
    id: 'amen15',
    name: 'Services de streaming',
    category: AmenityCategory.divertissement,
    iconName: "movie",
  ),
  Amenities(
    id: 'amen16',
    name: 'Jeux de société',
    category: AmenityCategory.divertissement,
    iconName: "sports_esports",
  ),

  // Extérieur
  Amenities(
    id: 'amen17',
    name: 'Parking',
    category: AmenityCategory.exterieur,
    iconName: "local_parking",
  ),
  Amenities(
    id: 'amen18',
    name: 'Piscine',
    category: AmenityCategory.exterieur,
    iconName: "pool",
  ),
  Amenities(
    id: 'amen19',
    name: 'Jardin',
    category: AmenityCategory.exterieur,
    iconName: "park",
  ),
  Amenities(
    id: 'amen20',
    name: 'Balcon/Terrasse',
    category: AmenityCategory.exterieur,
    iconName: "balcony",
  ),
  Amenities(
    id: 'amen21',
    name: 'Animaux acceptés',
    category: AmenityCategory.exterieur,
    iconName: "pets",
  ),

  // Accessibilité
  Amenities(
    id: 'amen22',
    name: 'Accès handicapé',
    category: AmenityCategory.accessibilite,
    iconName: "accessible",
  ),
  Amenities(
    id: 'amen23',
    name: 'Ascenseur',
    category: AmenityCategory.accessibilite,
    iconName: "elevator",
  ),
];
