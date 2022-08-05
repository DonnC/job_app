import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.headerTextColor,
    ),
    headline1: GoogleFonts.lato(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.headerTextColor,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: AppColors.headerTextColor,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.headerTextColor,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.headerTextColor,
    ),
    button: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.selectedTabTextColor,
    ),
  );

  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: lightTextTheme,
        appBarTheme: const AppBarTheme(color: AppColors.backgroundColor),
      );
}
