import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

class TextFieldDecoration {
  /// Returns the correct [InputDecoration] based on [isDarkModeEnabled]
  /// of the app.
  static InputDecoration textField(bool isDarkModeEnabled) {
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
              ? CustomColors.canvasLight
              : CustomColors.canvasDark,
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
}
