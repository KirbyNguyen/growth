import 'package:growth/pages/app_wrapper.dart';
import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/pages/authentication/email_sign_up_page.dart';

class NavigatonRoutes {
  static var navRoutes = {
    "/": (context) => const AppWrapper(),
    "/auth/options": (context) => const AuthOptionsPage(),
  };
}
