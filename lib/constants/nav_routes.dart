import 'package:flutter/material.dart';
import 'package:growth/pages/app_wrapper.dart';

import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/pages/authentication/email_auth_page.dart';
import 'package:growth/pages/authentication/email_register_page.dart';
import 'package:growth/pages/authentication/reset_password_page.dart';
import 'package:growth/pages/home_page.dart';

import 'package:growth/pages/misc/terms_conditions_page.dart';
/// [NavigationRoutes] provided routes' names for navigation through the app.
class NavigationRoutes {
  static const String blankRoute = "/";
  static const String termsRoute = "/terms";
  static const String resetRoute = "/routes";

  static const String authOptionsRoute = "/auth/options";
  static const String authEmailRoute = "/auth/email";
  static const String authRegisterRoute = "/auth/register";

  static const String homeRoute = "/home";

  static const String balanceDetailsRoute = "/balance/details";

  static const String balanceAccount = "/balance/account";

  static const String gardenDetailsRoute = "/garden/details";

  static Map<String, StatelessWidget Function(dynamic)> navRoutes = {
    blankRoute: (context) => const AppWrapper(),
    termsRoute: (context) => const TermsConditionsPage(),
    resetRoute: (context) => const ResetPasswordPage(),
    authOptionsRoute: (context) => const AuthOptionsPage(),
    authEmailRoute: (context) => const EmailAuthPage(),
    authRegisterRoute: (context) => const EmailRegisterPage(),
    homeRoute: (context) => const HomePage(),
  };
}
