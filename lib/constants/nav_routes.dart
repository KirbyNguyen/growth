import 'package:growth/pages/app_wrapper.dart';

import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/pages/authentication/email_auth_page.dart';
import 'package:growth/pages/authentication/email_register_page.dart';
import 'package:growth/pages/authentication/reset_password_page.dart';

import 'package:growth/pages/misc/terms_conditions_page.dart';

import 'package:growth/pages/balance/balance_home_page.dart';

import 'package:growth/pages/garden/garden_home_page.dart';

import 'package:growth/pages/settings/settings_home_page.dart';

/// Named routes for navigation through the app.
class NavigatonRoutes {
  static var navRoutes = {
    "/": (context) => const AppWrapper(),
    "/terms": (context) => const TermsConditionsPage(),
    "/reset": (context) => const ResetPasswordPage(),
    "/auth/options": (context) => const AuthOptionsPage(),
    "/auth/email": (context) => const EmailAuthPage(),
    "/auth/register": (context) => const EmailRegisterPage(),
    "/balance": (context) => const BalanceHomePage(),
    "/garden": (context) => const GardenHomePage(),
    "/settings": (context) => const SettingsHomePage(),
  };
}
