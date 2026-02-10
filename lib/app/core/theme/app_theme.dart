import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue, elevation: 0),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Color(0xFF121212),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1E1E1E), elevation: 0),
  );
}
