import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

class AuthTextFieldDecoration {
  /// Returns the correct [InputDecoration] based on [isDarkModeEnabled]
  /// of the app.
  static InputDecoration authTextField(bool isDarkModeEnabled) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: isDarkModeEnabled
              ? CustomColors.canvasLight
              : CustomColors.canvasDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: isDarkModeEnabled
              ? CustomColors.accentLight
              : CustomColors.accentDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: isDarkModeEnabled
              ? CustomColors.unfocusedErrorLight
              : CustomColors.unfocusedErrorDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: isDarkModeEnabled
              ? CustomColors.errorLight
              : CustomColors.errorDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  /// Returns the correct [Icon] based on [isPasswordObscured].
  static Icon passwordObscureIcon(
      bool isDarkModeEnabled, bool isPasswordObscured) {
    return Icon(
      isPasswordObscured ? Icons.visibility : Icons.visibility_off,
      color: isDarkModeEnabled ? Colors.white : Colors.green,
    );
  }
}
