import 'package:flutter/material.dart';
import 'package:growth/constants/colors.dart';


/// Bottom Tab Item for Bottom Tab Navigation Bar.
/// The class requires [pageName], [iconData], [page], and [isDarkMode].
class BottomTabItem {
  final String pageName;
  final IconData iconData;
  final Widget page;
  bool isDarkMode;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Color itemColor() =>
      isDarkMode ? CustomColors.primaryLight : CustomColors.primaryDark;

  BottomTabItem({
    required this.pageName,
    required this.iconData,
    required this.page,
    required this.isDarkMode,
  });
}
