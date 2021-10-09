import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

/// App Theme class to provide [lightThemeData] or [darkThemeData].
class AppTheme {
  final ColorScheme _lightScheme = const ColorScheme.light(
    primary: CustomColors.primaryLight,
    onPrimary: CustomColors.canvasDark,
    secondary: CustomColors.accentLight,
    onSecondary: CustomColors.canvasDark,
  );
  final ColorScheme _darkScheme = const ColorScheme.dark(
    primary: CustomColors.primaryDark,
    onPrimary: CustomColors.canvasLight,
    secondary: CustomColors.accentDark,
    onSecondary: CustomColors.canvasLight,
  );

  ColorScheme get lightScheme => _lightScheme;
  ColorScheme get darkScheme => _darkScheme;

  static final ThemeData _lightThemeData = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    colorScheme: AppTheme().lightScheme,
    dividerColor: CustomColors.canvasDark,
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CustomColors.canvasDark,
      unselectedItemColor: CustomColors.canvasLight,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
      ),
    ),
  );

  static final ThemeData _darkThemeData = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    colorScheme: AppTheme().darkScheme,
    dividerColor: CustomColors.canvasLight,
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CustomColors.canvasLight,
      unselectedItemColor: CustomColors.canvasDark,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
      ),
    ),
  );

  /// Returns the correct [ThemeData] based on [isDarkModeEnabled].
  ThemeData getThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}
