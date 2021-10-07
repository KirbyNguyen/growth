import 'package:growth/pages/app_wrapper.dart';

import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/pages/authentication/email_auth_page.dart';
import 'package:growth/pages/authentication/email_register_page.dart';
import 'package:growth/pages/authentication/reset_password_page.dart';

import 'package:growth/pages/misc/terms_conditions_page.dart';

/// Named routes for navigation through the app.
class NavigatonRoutes {
  static var navRoutes = {
    "/": (context) => const AppWrapper(),
    "/terms": (context) => const TermsConditionsPage(),
    "/reset": (context) => const ResetPasswordPage(),
    "/auth/options": (context) => const AuthOptionsPage(),
    "/auth/email": (context) => const EmailAuthPage(),
    "/auth/register": (context) => const EmailRegisterPage(),
  };
}
