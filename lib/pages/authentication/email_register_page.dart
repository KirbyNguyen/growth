import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/terms_text.dart';
import 'package:growth/components/error_dialog.dart';
import 'package:growth/components/email_register_form.dart';

import 'package:growth/styles/auth_decoration.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

/// Authentication page for email signup.
class EmailRegisterPage extends HookWidget {
  const EmailRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeState = useProvider(appThemeStateProvider);

    final _useAuthServices = useProvider(authServicesProvider);

    final _useEmailRegisterFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useEmailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _usePasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _useConfirmPasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final _useLoading = useState<bool>(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Sign Up")),
      body: Container(
        decoration:
            AuthDecoration.authGradientBackground(_useAppThemeState),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.10,
                      ),
                      child: EmailRegisterForm(
                          useEmailRegisterFormKey: _useEmailRegisterFormKey,
                          useEmailTextController: _useEmailTextController,
                          useAppThemeStateProvider: _useAppThemeState,
                          usePasswordTextController: _usePasswordTextController,
                          useConfirmPasswordTextController:
                              _useConfirmPasswordTextController),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: TermsText(
                        flavorText: "By signing up, you agree with our",
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: ElevatedButton(
                        onPressed: () async {
                          _useLoading.value = true;
                          if (_useEmailRegisterFormKey.value.currentState!
                              .validate()) {
                            AuthStatus status =
                                await _useAuthServices.signUpWithEmail(
                                    email: _useEmailTextController.text,
                                    password: _usePasswordTextController.text);

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
                                color: _useAppThemeState
                                    ? CustomColors.canvasLight
                                    : CustomColors.canvasDark,
                              )
                            : Text(
                                "SIGN UP",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                      ),
                    ),
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
