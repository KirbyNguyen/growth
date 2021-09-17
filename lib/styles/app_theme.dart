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
    textTheme: const TextTheme(
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(),
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
      ),
      button: TextStyle(),
      caption: TextStyle(),
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
    textTheme: const TextTheme(
      headline1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline5: TextStyle(),
      headline6: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(),
      bodyText1: TextStyle(
        fontSize: 16.0,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
      ),
      button: TextStyle(),
      caption: TextStyle(),
    ),
  );

  /// Returns the correct [ThemeData] based on [isDarkModeEnabled].
  ThemeData getThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}
