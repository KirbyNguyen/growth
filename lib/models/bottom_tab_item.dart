import 'package:flutter/material.dart';

/// Bottom Tab Item for Bottom Tab Navigation Bar.
/// The class requires [pageName], [iconData], [page], and [isDarkMode].
class BottomTabItem {
  final String pageName;
  final IconData iconData;
  final Widget page;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BottomTabItem({
    required this.pageName,
    required this.iconData,
    required this.page,
  });
}
