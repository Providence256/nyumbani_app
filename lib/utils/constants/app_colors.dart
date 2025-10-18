import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFFD74B00);
  static const Color primaryDark = Color(0xFFB83D00);
  static const Color primaryLight = Color(0xFFFF6B35);

  // Secondary Colors
  static const Color secondary = Color(0xFFCD853F);
  static const Color secondaryDark = Color(0xFFA0522D);
  static const Color secondaryLight = Color(0xFFDEB887);

  // Neutral Colors
  static const Color background = Color(0xFFFAF9F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF5F5F0);

  // Neutral Colors - Light Mode
  static const Color backgroundLight = Color(0xFFFFFBF7);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFF8F3);
  static const Color dividerLight = Color(0xFFE0E0E0);

  // Neutral Colors - Dark Mode
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardDark = Color(0xFF2D2D2D);
  static const Color dividerDark = Color(0xFF404040);

  // Text Colors - Light Mode
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF666666);
  static const Color textHintLight = Color(0xFF999999);

  // Text Colors - Dark Mode
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textHintDark = Color(0xFF808080);

  // Status Colors (Same for both modes)
  static const Color success = Color(0xFF4CAF50);
  static const Color successDark = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFF9800);
  static const Color warningDark = Color(0xFFFFB74D);
  static const Color error = Color(0xFFF44336);
  static const Color errorDark = Color(0xFFEF5350);
  static const Color info = Color(0xFF2196F3);
  static const Color infoDark = Color(0xFF42A5F5);

  // Shadow colors
  static Color shadowLight = Colors.black.withValues(alpha: 0.1);
  static Color shadowDark = Colors.black.withValues(alpha: 0.7);
}
