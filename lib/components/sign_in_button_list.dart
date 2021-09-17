import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:growth/components/terms_text.dart';
import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/providers/app_theme_provider.dart';

/// [AuthOptionsLowerContainer] provides a list of authentication buttons with
/// Google, Apple, and Email.
class AuthOptionsLowerContainer extends HookWidget {
  const AuthOptionsLowerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);
    final _useAppThemeNotifierrovider =
        useProvider(appThemeStateProvider.notifier);

    return Expanded(
      flex: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: AuthDecoration.lowerContainer(_useAppThemeStateProvider),
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
                  SignInButton(
                    _useAppThemeStateProvider
                        ? Buttons.GoogleDark
                        : Buttons.Google,
                    onPressed: () {
                      _useAppThemeNotifierrovider.toggleAppTheme(context);
                    },
                  ),
                  SignInButton(
                    _useAppThemeStateProvider
                        ? Buttons.AppleDark
                        : Buttons.Apple,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Email,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: TermsText(
                flavorText: "By logging in, you agree with our",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
