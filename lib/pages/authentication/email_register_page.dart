import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/terms_text.dart';
import 'package:growth/components/error_dialog.dart';

import 'package:growth/services/validator_service.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/styles/auth_text_field_style.dart';

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
                  // Email sign-up form
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
                  // Terms and conditions text
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: TermsText(
                        flavorText: "By signing up, you agree with our",
                      ),
                    ),
                  ),
                  // Submit button
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

/// [EmailRegisterForm] provides 3 text fields for email, password, and confirm
/// password.
class EmailRegisterForm extends HookWidget {
  const EmailRegisterForm({
    Key? key,
    required ValueNotifier<GlobalKey<FormState>> useEmailRegisterFormKey,
    required TextEditingController useEmailTextController,
    required bool useAppThemeStateProvider,
    required TextEditingController usePasswordTextController,
    required TextEditingController useConfirmPasswordTextController,
  })  : _useEmailRegisterFormKey = useEmailRegisterFormKey,
        _useEmailTextController = useEmailTextController,
        _useAppThemeStateProvider = useAppThemeStateProvider,
        _usePasswordTextController = usePasswordTextController,
        _useConfirmPasswordTextController = useConfirmPasswordTextController,
        super(key: key);

  final ValueNotifier<GlobalKey<FormState>> _useEmailRegisterFormKey;
  final bool _useAppThemeStateProvider;
  final TextEditingController _useEmailTextController;
  final TextEditingController _usePasswordTextController;
  final TextEditingController _useConfirmPasswordTextController;

  @override
  Widget build(BuildContext context) {
    final _usePasswordObscured = useState<bool>(true);

    return Form(
      key: _useEmailRegisterFormKey.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Email text field
          TextFormField(
            autocorrect: false,
            controller: _useEmailTextController,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorService.validateEmail(value),
            decoration:
                AuthTextFieldDecoration.authTextField(_useAppThemeStateProvider)
                    .copyWith(hintText: "Email"),
          ),
          // Password text field
          TextFormField(
            autocorrect: false,
            controller: _usePasswordTextController,
            obscureText: _usePasswordObscured.value,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorService.validatePassword(value),
            decoration:
                AuthTextFieldDecoration.authTextField(_useAppThemeStateProvider)
                    .copyWith(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  _usePasswordObscured.value = !_usePasswordObscured.value;
                },
                child: AuthTextFieldDecoration.passwordObscureIcon(
                    _useAppThemeStateProvider, _usePasswordObscured.value),
              ),
            ),
          ),
          // Confirm password text field
          TextFormField(
            autocorrect: false,
            controller: _useConfirmPasswordTextController,
            obscureText: _usePasswordObscured.value,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              return ValidatorService.validateConfirmPassword(
                  value, _usePasswordTextController.text);
            },
            decoration:
                AuthTextFieldDecoration.authTextField(_useAppThemeStateProvider)
                    .copyWith(
              hintText: "Confirm Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  _usePasswordObscured.value = !_usePasswordObscured.value;
                },
                child: AuthTextFieldDecoration.passwordObscureIcon(
                    _useAppThemeStateProvider, _usePasswordObscured.value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
