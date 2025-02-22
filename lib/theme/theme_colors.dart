import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF032156),
    hintColor: const Color(0xFF0056b3),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xFF212121))),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF032156),
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: const Color(0xFFD31313),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF032156),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF90CAF9),
    hintColor: const Color(0xFF42A5F5),
    scaffoldBackgroundColor: const Color(0xFF032156),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: const Color(0xFFD31313),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF032156),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF42A5F5),
      textTheme: ButtonTextTheme.primary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
