import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color(0xFFFE0000),
  primary: const Color(0xFFFE0000),
  onPrimary: const Color(0xFFffffff),
  background: const Color(0xFFffffff),
  onBackground: const Color(0xFF1a1c18),
  surface: const Color(0xffF5F5F5),
  onSurface: const Color(0xFF8B8B8B),
);

const secondary = Color(0xFF000000);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightColorScheme.background,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  splashColor: Colors.grey.shade100,
  focusColor: lightColorScheme.primary,
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryTextTheme: GoogleFonts.montserratTextTheme(),
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.montserrat(
        color: secondary, fontWeight: FontWeight.w600, fontSize: 16),
    color: Colors.transparent,
    scrolledUnderElevation: 0.5,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: secondary,
    ),
  ),
  dialogTheme: DialogTheme(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        backgroundColor: lightColorScheme.primary,
        padding: const EdgeInsets.all(13),
        elevation: 0,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        alignment: Alignment.center,
        enableFeedback: true,
        side: const BorderSide(width: 0, color: Colors.transparent)),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: secondary,
          elevation: 0,
          textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500))),
  iconTheme: const IconThemeData(color: secondary),
  listTileTheme: ListTileThemeData(
    textColor: Colors.black,
    tileColor: Colors.transparent,
    titleTextStyle: GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    iconColor: Colors.black
  ),
  chipTheme: ChipThemeData(
    backgroundColor: lightColorScheme.onBackground,
    pressElevation: 5,
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(6),
    ),
    errorMaxLines: 4,
    filled: true,
    fillColor: Colors.white,
    focusColor: lightColorScheme.primary,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondary, width: 0.8),
        borderRadius: BorderRadius.circular(6)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: lightColorScheme.error, width: 1),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.8), width: 0.8),
      borderRadius: BorderRadius.circular(6),
    ),
  ),
  bottomSheetTheme:
      const BottomSheetThemeData(elevation: 1, shadowColor: Colors.grey),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    enableFeedback: true,
    selectedLabelStyle: GoogleFonts.montserrat(fontSize: 12),
    unselectedIconTheme: IconThemeData(color: secondary.withOpacity(0.4)),
    selectedIconTheme: const IconThemeData(color: secondary),
  ),
);
