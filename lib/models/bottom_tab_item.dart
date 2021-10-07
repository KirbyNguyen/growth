import 'package:flutter/material.dart';

/// Bottom Tab Item for Bottom Tab Navigation Bar.
/// The class requires [pageName], [iconData], [Navigator], and [GlobalKey]
/// with [NavigatorState].
class BottomTabItem {
  final String pageName;
  final IconData iconData;
  final Navigator navigator;
  final GlobalKey<NavigatorState> navigatorKey;

  BottomTabItem({
    required this.pageName,
    required this.iconData,
    required this.navigator,
    required this.navigatorKey,
  });
}
