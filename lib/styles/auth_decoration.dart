import 'package:flutter/material.dart';
import 'package:growth/constants/colors.dart';

class AuthDecoration {
  /// Returns the correct [LinearGradient] based on [isDarkModeEnabled]
  /// of the app.
  static BoxDecoration authGradientBackground(bool isDarkModeEnabled) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          isDarkModeEnabled
              ? CustomColors.gradientTopDark
              : CustomColors.gradientTopLight,
          isDarkModeEnabled
              ? CustomColors.gradientBotDark
              : CustomColors.gradientBotLight,
        ],
      ),
    );
  }

  /// Returns the correct [BoxDecoration] for the logo based on
  /// [isDarkModeEnabled] of the app.
  static BoxDecoration logoContainer(bool isDarkModeEnabled) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: isDarkModeEnabled
          ? CustomColors.accentDark
          : CustomColors.accentLight,
      border: Border.all(
        color: isDarkModeEnabled
            ? CustomColors.primaryDark
            : CustomColors.primaryLight,
        width: 10.0,
      ),
    );
  }
}
