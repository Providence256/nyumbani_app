import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class AppInputDecoration {
  AppInputDecoration._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.normal),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.dividerLight),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.dividerLight),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.primary.withValues(alpha: 0.5),
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.error, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    hintStyle: TextStyle(color: AppColors.textHintLight),
    filled: true,
    fillColor: AppColors.surfaceLight,
  );

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.normal),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.dividerDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.dividerDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.primaryLight.withValues(alpha: 0.5),
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.errorDark, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    hintStyle: TextStyle(color: AppColors.textHintDark),
    filled: true,
    fillColor: AppColors.cardDark,
  );
}
