import 'package:flutter/material.dart';

class AppTheme {
  static get load => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0030ff),
          secondary: Colors.blue,
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 85, 58, 210),
          contentTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
}
