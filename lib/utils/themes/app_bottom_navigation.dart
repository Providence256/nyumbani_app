import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class AppBottomNavigation {
  AppBottomNavigation._();

  static BottomNavigationBarThemeData lightBottomNavigation =
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryLight,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
      );

  static BottomNavigationBarThemeData darkBottomNavigation =
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryDark,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.textSecondaryDark,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
      );
}
