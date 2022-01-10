import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/providers/theme_provider.dart';

/// [SignInButtonList] provides a list of authentication buttons with
/// Google, Apple, and Email.
class SignInButtonList extends HookConsumerWidget {
  const SignInButtonList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.read(appThemeStateProvider);

    return Expanded(
      flex: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: AuthDecoration.lowerContainer(darkModeEnabled),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text("Sign in with Google"),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("Sign in with Apple"),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("Sign in with Email"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/auth/signup");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
