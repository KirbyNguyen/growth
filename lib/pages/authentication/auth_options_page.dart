import 'package:flutter/material.dart';
import 'package:growth/components/terms_conditions_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/constants/custom_colors.dart';
import 'package:growth/providers/theme_provider.dart';
import 'package:growth/components/sign_in_button_list.dart';

class AuthOptionsPage extends HookConsumerWidget {
  const AuthOptionsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.read(appThemeStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            decoration: AuthDecoration.authGradientBackground(darkModeEnabled),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                const SignInButtonList(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: darkModeEnabled
                        ? CustomColors.accentDark
                        : CustomColors.accentLight,
                  ),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "By signing in, you agree to our",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const TermsConditionsText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: AuthDecoration.logoContainer(darkModeEnabled),
            ),
          ),
        ],
      ),
    );
  }
}
