import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';

class AppTextButton {
  AppTextButton._();

  static TextButtonThemeData lightTextButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );

  static TextButtonThemeData darkTextButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryLight,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}
