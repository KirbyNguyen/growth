import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

class AuthTextFieldDecoration {
  static InputDecoration authTextField(bool darkModeEnabled) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkModeEnabled
              ? CustomColors.canvasLight
              : CustomColors.canvasDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: darkModeEnabled
              ? CustomColors.accentLight
              : CustomColors.accentDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkModeEnabled
              ? CustomColors.unfocusedErrorLight
              : CustomColors.unfocusedErrorDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: darkModeEnabled
              ? CustomColors.errorLight
              : CustomColors.errorDark,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  static Icon passwordObscureIcon(bool darkModeEnabled, bool passwordObscured) {
    return Icon(
      passwordObscured ? Icons.visibility : Icons.visibility_off,
      color: darkModeEnabled ? Colors.white : Colors.black,
    );
  }
}
