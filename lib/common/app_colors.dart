import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF6366F1);
  static const secondary = Color(0xFFEC4899);
  static const background = Color(0xFFF8FAFC);
  static const surface = Colors.white;
  static const textMain = Color(0xFF1E293B);
}

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  textTheme: GoogleFonts.quicksandTextTheme(),
  scaffoldBackgroundColor: AppColors.background,
);
