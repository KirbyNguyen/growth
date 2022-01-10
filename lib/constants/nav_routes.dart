import 'package:flutter/material.dart';
import 'package:growth/pages/app_wrapper.dart';

import 'package:growth/pages/home_page.dart';

import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/pages/authentication/email_sign_in_page.dart';
import 'package:growth/pages/authentication/email_sign_up_page.dart';
import 'package:growth/pages/authentication/reset_password_page.dart';

import 'package:growth/pages/misc/terms_conditions_page.dart';

class NavigationRoutes {
  static const String blankRoute = "/";
  static const String termsRoute = "/terms";
  static const String resetRoute = "/routes";

  static const String authOptionsRoute = "/auth/options";
  static const String authSignInRoute = "/auth/signin";
  static const String authSignUpRoute = "/auth/signup";

  static const String homeRoute = "/home";

  static const String balanceDetailsRoute = "/balance/details";

  static const String balanceAccountCreate = "/balance/account/create";
  static const String balanceAccountEdit = "/balance/account/edit";

  static const String gardenDetailsRoute = "/garden/details";

  static Map<String, Widget Function(dynamic)> navRoutes = {
    blankRoute: (context) => const AppWrapper(),
    termsRoute: (context) => const TermsConditionsPage(),
    resetRoute: (context) => const ResetPasswordPage(),
    authOptionsRoute: (context) => const AuthOptionsPage(),
    authSignInRoute: (context) => const EmailSignInPage(),
    authSignUpRoute: (context) => const EmailSignUpPage(),
    homeRoute: (context) => const HomePage(),
  };
}
