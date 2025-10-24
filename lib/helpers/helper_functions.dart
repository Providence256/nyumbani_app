import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyumbani_app/models/amenities.dart';
import 'package:nyumbani_app/models/date_range.dart';
import 'package:nyumbani_app/models/guest_info.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HelperFunctions {
  static IconData getAmenitiesIcon(Amenities amenities) {
    switch (amenities.name) {
      case 'Wi-Fi':
        return PhosphorIcons.wifiHigh();
      case 'Parking':
        return PhosphorIcons.car();
      case 'Piscine':
        return Icons.pool;
      case 'Cuisine':
        return Icons.flatware;
      case 'Climatisation':
        return Icons.ac_unit;
      case 'TV':
        return Icons.tv;
      case 'Machine à laver':
        return Icons.wash;
      case 'Jardin':
        return Icons.forest;
      case 'Sécurité':
        return Icons.security;
      case 'Animaux acceptés':
        return Icons.pets;
      case 'Chauffage':
        return Icons.thermostat;
      case 'Sèche-linge':
        return Icons.dry_cleaning;
      case 'Réfrigérateur':
        return Icons.kitchen_outlined;
      case 'Micro-ondes':
        return Icons.microwave;
      case 'Cafetière':
        return Icons.coffee_maker;
      case 'Détecteur de fumée':
        return Icons.smoke_free;
      case 'Trousse de premiers secourss':
        return Icons.medical_services;
      case 'Extincteur':
        return Icons.fire_extinguisher;
      case 'Services de streaming':
        return Icons.movie;
      case 'Jeux de société':
        return Icons.sports_esports;
      case 'Balcon/Terrasse':
        return Icons.balcony;
      case 'Accès handicapé':
        return Icons.accessibility;
      case 'Ascenseur':
        return Icons.elevator;
      case 'Trousse de premiers secours':
        return Icons.medical_services;
      default:
        return Icons.help_outline;
    }
  }

  static String categoryLabel(AmenityCategory category) {
    switch (category) {
      case AmenityCategory.essentiels:
        return 'Essentiels';
      case AmenityCategory.cuisine:
        return 'Cuisine';
      case AmenityCategory.securite:
        return 'Sécurité';
      case AmenityCategory.divertissement:
        return 'Divertissement';
      case AmenityCategory.exterieur:
        return 'Extérieur';
      case AmenityCategory.accessibilite:
        return 'Accessibilité';
    }
  }

  /// capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  ///format month and year
  static String formatMonthYear(DateTime date) {
    return capitalize(DateFormat('MMMM yyyy', 'fr_FR').format(date));
  }

  ///Format  day
  static String formatDay(DateTime date) {
    return capitalize(DateFormat.MMMEd('fr_FR').format(date));
  }

  /// Format full date
  static String formatFullDate(DateTime date) {
    return capitalize(DateFormat.yMMMEd('fr_FR').format(date));
  }

  ///Calculate number of night
  static int calculateNights(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return 0;

    if (endDate.isBefore(startDate)) return 0;

    return endDate.difference(startDate).inDays;
  }

  // calculate total price
  static double calculateTotalPrice(DateRange dateRange, double price) {
    final nights = HelperFunctions.calculateNights(
      dateRange.checkInDate,
      dateRange.checkOutDate,
    );

    final totalPrice = price * nights;

    return totalPrice;
  }

  static String getGuestSummary(GuestInfo info) {
    final parts = <String>[];

    if (info.adults > 0) {
      parts.add('${info.adults} ${info.adults == 1 ? 'adulte' : 'adultes'} ');
    }
    if (info.children > 0) {
      parts.add(
        '${info.children} ${info.children == 1 ? "enfant" : "enfants"}',
      );
    }
    if (info.babies > 0) {
      parts.add('${info.babies} ${info.babies == 1 ? "bébé" : "bébés"}');
    }

    return parts.join(', ');
  }
}
