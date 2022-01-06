import 'package:flutter/material.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/constants/color_scheme.dart';

class AppTheme {
  final ThemeData _lightThemeData = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    colorScheme: CustomColorScheme.lightColorScheme,
    dividerColor: CustomColors.canvasDark,
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CustomColors.canvasDark,
      unselectedItemColor: CustomColors.canvasLight,
    ),
  );

  final ThemeData _darkThemeData = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    colorScheme: CustomColorScheme.darkColorScheme,
    dividerColor: CustomColors.canvasLight,
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CustomColors.canvasLight,
      unselectedItemColor: CustomColors.canvasDark,
    ),
  );

  ThemeData getThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}
