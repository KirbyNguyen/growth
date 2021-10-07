import 'package:flutter/material.dart';
import 'package:growth/models/bottom_tab_item.dart';

import 'package:growth/constants/bottom_tab_navigators.dart';

/// [BottomItemList] contains NavigatorState for [BottomNavigationBar] in the
/// [HomePage].
class BottomItemList {
  final GlobalKey<NavigatorState> _balanceNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _gardenNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _settingsNavigatorKey =
      GlobalKey<NavigatorState>();

  /// Provides a list of [BottomTabItem].
  List<BottomTabItem> list() => <BottomTabItem>[
        BottomTabItem(
          pageName: "Balance",
          iconData: Icons.account_balance,
          navigatorKey: _balanceNavigatorKey,
          navigator: BottomTabNavigators.balanceNavigator(_balanceNavigatorKey),
        ),
        BottomTabItem(
          pageName: "Garden",
          iconData: Icons.spa,
          navigatorKey: _gardenNavigatorKey,
          navigator: BottomTabNavigators.gardenNavigator(_gardenNavigatorKey),
        ),
        BottomTabItem(
          pageName: "Settings",
          iconData: Icons.settings,
          navigatorKey: _settingsNavigatorKey,
          navigator:
              BottomTabNavigators.settingsNavigator(_settingsNavigatorKey),
        ),
      ];
}
