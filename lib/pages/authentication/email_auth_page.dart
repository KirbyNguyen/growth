import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/sign_up_test.dart';
import 'package:growth/components/error_dialog.dart';
import 'package:growth/components/email_auth_form.dart';

import 'package:growth/styles/auth_decoration.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

/// Authentication page for email logins.
class EmailAuthPage extends HookWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);

    final _useAuthServicesProvider = useProvider(authServicesProvider);

    final _useEmailAuthFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useEmailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _usePasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final _useLoading = useState<bool>(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Email Sign-in"),
      ),
      body: Container(
        decoration:
            AuthDecoration.authGradientBackground(_useAppThemeStateProvider),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
          horizontal: MediaQuery.of(context).size.width * 0.10,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "GROWTH",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: EmailAuthForm(
                        useEmailFormKey: _useEmailAuthFormKey,
                        useEmailTextController: _useEmailTextController,
                        useAppThemeStateProvider: _useAppThemeStateProvider,
                        usePasswordTextController: _usePasswordTextController),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: ElevatedButton(
                          onPressed: () async {
                            _useLoading.value = true;
                            if (_useEmailAuthFormKey.value.currentState!
                                .validate()) {
                              AuthStatus status = await _useAuthServicesProvider
                                  .signInWithEmail(
                                      email: _useEmailTextController.text,
                                      password:
                                          _usePasswordTextController.text);

                              // Checks error server side
                              if (status != AuthStatus.successful) {
                                CustomErrorDialog errorDialog =
                                    CustomErrorDialog(context: context);
                                await errorDialog.showError(status);
                              } else {
                                Navigator.of(context).popUntil(
                                  ModalRoute.withName(
                                      NavigationRoutes.blankRoute),
                                );
                              }
                            }
                            _useLoading.value = false;
                          },
                          child: _useLoading.value
                              ? CircularProgressIndicator(
                                  color: _useAppThemeStateProvider
                                      ? CustomColors.canvasLight
                                      : CustomColors.canvasDark,
                                )
                              : Text(
                                  "SIGN IN",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: RegisterText(),
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
