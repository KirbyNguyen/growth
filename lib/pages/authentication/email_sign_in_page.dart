import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/providers/theme_provider.dart';
import 'package:growth/components/email_sign_in_form.dart';

class EmailSignInPage extends HookConsumerWidget {
  const EmailSignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.watch(appThemeStateProvider);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.005,
          ),
          decoration: AuthDecoration.authGradientBackground(darkModeEnabled),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        "GROWTH",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: EmailSignInForm(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          InkWell(
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(NavigationRoutes.authSignUpRoute);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
