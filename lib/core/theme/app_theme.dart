import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'SF Pro Display',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accent,
        surface: AppColors.card,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.subtleText,
          height: 1.4,
        ),
      ),
    );
  }
}
