import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

class CustomColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: CustomColors.primaryLight,
    onPrimary: CustomColors.canvasDark,
    secondary: CustomColors.accentLight,
    onSecondary: CustomColors.canvasDark,
  );
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: CustomColors.primaryDark,
    onPrimary: CustomColors.canvasLight,
    secondary: CustomColors.accentDark,
    onSecondary: CustomColors.canvasLight,
  );
}
