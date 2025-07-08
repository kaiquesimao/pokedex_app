import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 23, 62, 165);
  static const Color primaryLight = Color.fromARGB(255, 15, 42, 124);
  static const Color primaryDark = Color.fromARGB(255, 31, 82, 206);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: primaryLight,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black87),
      titleMedium: TextStyle(color: Colors.black87),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryDark,
      secondary: primaryColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white70),
      titleMedium: TextStyle(color: Colors.white70),
    ),
  );
}
