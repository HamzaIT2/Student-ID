import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 155, 165, 58),
      foregroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 121, 128, 63),
      foregroundColor: Colors.white,
    ),
  );
}
