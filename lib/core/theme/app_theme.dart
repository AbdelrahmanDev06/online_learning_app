import 'package:flutter/material.dart';

class AppColors {
  static const buttonPrimary = Color(0xFF3D5CFF);
  static const secondary = Color(0xFFF59E0B);
  static const background = Color(0x1F1F39);
  static const textColor = Color(0xFFEAEAFF);
  static const error = Color(0xFFDC2626);
}

class AppTextStyles {
  static const heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static const caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.buttonPrimary,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.light(
      primary: AppColors.buttonPrimary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.heading,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
