import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

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

  /// Returns the correct [BoxDecoration] based on [isDarkModeEnabled]
  /// for the authentication container that holds three sign in buttons.
  static BoxDecoration lowerContainer(bool isDarkModeEnabled) {
    return BoxDecoration(
      color: isDarkModeEnabled
          ? CustomColors.accentDark
          : CustomColors.accentLight,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(80.0),
        topRight: Radius.circular(80.0),
      ),
    );
  }
}
