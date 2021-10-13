import 'package:flutter/material.dart';
import 'package:growth/constants/nav_routes.dart';

/// [RegisterText] provides the sign up link for new users.
class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Text(
          "Don't have an account?",
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(NavigationRoutes.authRegisterRoute);
          },
          child: Text(
            "Sign Up!",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
