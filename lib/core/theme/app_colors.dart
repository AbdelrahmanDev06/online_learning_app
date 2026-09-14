import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1F1F39);
  static const Color secondary = Color(0xFF3D5CFF);

  static const Color darkCard = Color(0xFF2B2A44);
  static const Color lightCard = Color(0xFFDCE6FB);
  static const Color meetupCard = Color(0xFFF1E9FB);

  static const Color darkSurfaceAlt = Color(0xFF17142A);

  static const Color secondaryButton = Colors.deepOrange;
  static const Color accent = Colors.deepPurpleAccent;
  static const Color iconAccent = Colors.deepPurple;

  static const Color navSelected = Colors.deepPurple;
  static const Color navUnselected = Colors.grey;
  static const Color navShadow = Colors.black12;

  static const Color textPrimaryLight = Colors.white;
  static const Color textSecondaryLight = Colors.white70;
  static const Color textMutedLight = Colors.white54;
  static const Color textFaintLight = Colors.white38;
  static const Color dividerLight = Colors.white24;
  static const Color dividerFaint = Colors.white12;
  static const Color placeholderSurface = Colors.white10;

  static const Color textPrimaryDark = Colors.black87;
  static const Color textSecondaryDark = Colors.black54;

  static const Color success = Colors.green;
  static const Color error = Colors.redAccent;

  static const Color googleRed = Colors.red;
  static const Color facebookBlue = Color(0xFF1877F2);

  static const Color surfaceWhite = Colors.white;

  static Color get inputFill => Colors.white.withValues(alpha: 0.06);
}
