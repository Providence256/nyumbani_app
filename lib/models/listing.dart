import 'package:nyumbani_app/models/address.dart';
import 'package:nyumbani_app/models/amenities.dart';
import 'package:nyumbani_app/models/listing_rule.dart';
import 'package:nyumbani_app/models/listing_type.dart';

class Listing {
  final String id;
  final String hostId;
  final String title;
  final String description;
  final double price;
  final ListingType type;
  final Address address;
  final List<String> images;
  final List<Amenities> amenities;
  final List<ListingRule> rules;
  final int maxGuest;
  final int beds;
  final int bedRooms;
  final int bathRooms;
  final double rating;
  final bool isActive;
  final int reviewCouting;
  final DateTime createdAt;

  const Listing({
    required this.id,
    required this.hostId,
    required this.title,
    required this.description,
    required this.price,
    required this.type,
    required this.address,
    required this.images,
    required this.amenities,
    required this.rules,
    required this.maxGuest,
    required this.beds,
    required this.bedRooms,
    required this.bathRooms,
    required this.rating,
    required this.isActive,
    required this.reviewCouting,
    required this.createdAt,
  });
}
