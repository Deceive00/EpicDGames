import 'package:flutter/material.dart';

class CustomColors {
  static const int _primaryValue = 0xFF242424;

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE0E0E0),
      100: Color(0xFFB3B3B3),
      200: Color(0xFF808080),
      300: Color(0xFF4D4D4D),
      400: Color(0xFF262626), 
      500: Color(_primaryValue), 
      600: Color(0xFF222222),
      700: Color(0xFF1E1E1E),
      800: Color(0xFF1A1A1A),
      900: Color(0xFF151515),
    },
  );
static const MaterialColor blue = MaterialColor(
  0xFF215DF3, // The primary color value in ARGB format
  <int, Color>{
    50: Color(0xFFD3E2FD),
    100: Color(0xFFBBCEFA),
    200: Color(0xFFA1BAF7),
    300: Color(0xFF88A6F4),
    400: Color(0xFF6E92F1),
    500: Color(0xFF547EF0), // This is the primary color you provided
    600: Color(0xFF3F64EE),
    700: Color(0xFF3A57EC),
    800: Color(0xFF344AEB),
    900: Color(0xFF2F3CE9),
  },
);
    static const MaterialColor white = MaterialColor(
    0xFFFFFFFF, // Set the primary color value to white
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static Color loginTextColor = const Color.fromARGB(212, 158, 158, 158);

  static Color loginFillColor = const Color(0xFF2b2b2b);

  static Color navigationColor = const Color.fromARGB(255, 19, 20, 21);
  static Color textColor = Colors.white;
}