import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

class AccountCardStyle {
  static BoxDecoration addAccountCard(bool isDarkModeEnabled) {
    return BoxDecoration(
      border: Border.all(
        width: 1.0,
        color: isDarkModeEnabled
            ? CustomColors.canvasLight
            : CustomColors.canvasDark,
      ),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  static BoxDecoration normalCard(int colorValue) {
    return BoxDecoration(
      border: Border.all(
        width: 3.0,
        color: Color(colorValue),
      ),
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}
