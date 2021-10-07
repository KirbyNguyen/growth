import 'package:flutter/material.dart';
import 'package:growth/constants/nav_routes.dart';

import 'package:growth/pages/balance/balance_details_page.dart';
import 'package:growth/pages/balance/balance_home_page.dart';

import 'package:growth/pages/garden/garden_details_page.dart';
import 'package:growth/pages/garden/garden_home_page.dart';

import 'package:growth/pages/settings/settings_home_page.dart';

/// [BottomTabNavigators] contain [Navigator] for [BottomNavigationBar] in the
/// [HomePage].
class BottomTabNavigators {
  /// Provides [Navigator] for [BalanceHomePage].
  static Navigator balanceNavigator(GlobalKey<NavigatorState> navigatorKey) =>
      Navigator(
        key: navigatorKey,
        initialRoute: NavigationRoutes.blankRoute,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case NavigationRoutes.blankRoute:
              builder = (BuildContext context) => const BalanceHomePage();
              break;
            case NavigationRoutes.balanceDetailsRoute:
              builder = (BuildContext context) => const BalanceDetailsPage();
              break;
            default:
              throw Exception("Invalid route: ${settings.name}");
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
      );

  /// Provides [Navigator] for [GardenHomePage].
  static Navigator gardenNavigator(GlobalKey<NavigatorState> navigatorKey) =>
      Navigator(
        key: navigatorKey,
        initialRoute: NavigationRoutes.blankRoute,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case NavigationRoutes.blankRoute:
              builder = (BuildContext context) => const GardenHomePage();
              break;
            case NavigationRoutes.gardenDetailsRoute:
              builder = (BuildContext context) => const GardenDetailsPage();
              break;
            default:
              throw Exception("Invalid route: ${settings.name}");
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
      );

  /// Provides [Navigator] for [SettingsHomePage].
  static Navigator settingsNavigator(GlobalKey<NavigatorState> navigatorKey) =>
      Navigator(
        key: navigatorKey,
        initialRoute: NavigationRoutes.blankRoute,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case NavigationRoutes.blankRoute:
              builder = (BuildContext context) => const SettingsHomePage();
              break;
            default:
              throw Exception("Invalid route: ${settings.name}");
          }
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
      );
}
