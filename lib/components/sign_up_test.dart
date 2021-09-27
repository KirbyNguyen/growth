import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, "/auth/register");
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
