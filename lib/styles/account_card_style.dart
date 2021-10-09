import 'package:flutter/material.dart';
import 'package:growth/constants/custom_colors.dart';

/// [AccountCardStyle] provides the correct [BoxDecoration] for the [AccountCard]
/// based on [isDarModeEnabled].
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
}
