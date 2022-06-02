import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? Colors.grey.shade900 : Colors.white,
        primaryColor: isDarkTheme
            ? Colors.black
            : const Color.fromARGB(255, 213, 212, 212),
        secondaryHeaderColor: isDarkTheme ? Colors.white : Colors.black,
        canvasColor: isDarkTheme
            ? const Color.fromARGB(167, 0, 0, 0)
            : const Color.fromARGB(255, 205, 203, 203),
        focusColor: isDarkTheme
            ? const Color.fromARGB(255, 196, 195, 195)
            : const Color.fromARGB(255, 99, 99, 99),
        cardColor: isDarkTheme
            ? const Color.fromARGB(233, 55, 55, 55)
            : const Color.fromARGB(255, 227, 225, 225),
        colorScheme:
            isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light());
  }
}
