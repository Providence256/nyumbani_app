// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

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

  @override
  String toString() {
    return 'Listing(id: $id, hostId: $hostId, title: $title, description: $description, price: $price, type: $type, address: $address, images: $images, amenities: $amenities, rules: $rules, maxGuest: $maxGuest, beds: $beds, bedRooms: $bedRooms, bathRooms: $bathRooms, rating: $rating, isActive: $isActive, reviewCouting: $reviewCouting, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Listing other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hostId == hostId &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.type == type &&
        other.address == address &&
        listEquals(other.images, images) &&
        listEquals(other.amenities, amenities) &&
        listEquals(other.rules, rules) &&
        other.maxGuest == maxGuest &&
        other.beds == beds &&
        other.bedRooms == bedRooms &&
        other.bathRooms == bathRooms &&
        other.rating == rating &&
        other.isActive == isActive &&
        other.reviewCouting == reviewCouting &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hostId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        type.hashCode ^
        address.hashCode ^
        images.hashCode ^
        amenities.hashCode ^
        rules.hashCode ^
        maxGuest.hashCode ^
        beds.hashCode ^
        bedRooms.hashCode ^
        bathRooms.hashCode ^
        rating.hashCode ^
        isActive.hashCode ^
        reviewCouting.hashCode ^
        createdAt.hashCode;
  }
}
