import 'package:flutter/material.dart';
import 'package:growth/constants/colors.dart';

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
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedLabelStyle: TextStyle(color: CustomColors.canvasLight),
      selectedIconTheme: IconThemeData(color: CustomColors.canvasLight),
      unselectedIconTheme: IconThemeData(color: CustomColors.canvasDark),
    ),
  );

  static final ThemeData _darkThemeData = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    colorScheme: AppTheme().darkScheme,
    appBarTheme: const AppBarTheme(
      color: CustomColors.primaryDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedLabelStyle: TextStyle(color: CustomColors.canvasDark),
      selectedIconTheme: IconThemeData(color: CustomColors.canvasDark),
      unselectedIconTheme: IconThemeData(color: CustomColors.canvasLight),
    ),
  );

  /// Returns the correct [ThemeData] based on [isDarkModeEnabled].
  ThemeData getThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}
