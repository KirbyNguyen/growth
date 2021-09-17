import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/components/sign_in_button_list.dart';

/// Authentication Options Page that includes email, google, and apple sign-in
/// buttons.
class AuthOptionsPage extends HookWidget {
  const AuthOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            decoration: AuthDecoration.authGradientBackground(
                _useAppThemeStateProvider),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                const AuthOptionsLowerContainer(),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration:
                  AuthDecoration.logoContainer(_useAppThemeStateProvider),
            ),
          ),
        ],
      ),
    );
  }
}
