import 'package:flutter/material.dart';

/// [BottomTabItem] for Bottom Tab Navigation Bar.
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
