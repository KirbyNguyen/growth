import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/sign_up_text.dart';
import 'package:growth/components/error_dialog.dart';

import 'package:growth/services/validator_service.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/styles/auth_text_field_style.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

/// [EmailAuthPage] provides authentication for email logins.
class EmailAuthPage extends HookWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeState = useProvider(appThemeStateProvider);

    final _useAuthServices = useProvider(authServicesProvider);

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
        decoration: AuthDecoration.authGradientBackground(_useAppThemeState),
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
                  // Email authentication form
                  Expanded(
                    flex: 3,
                    child: EmailAuthForm(
                        useEmailFormKey: _useEmailAuthFormKey,
                        useEmailTextController: _useEmailTextController,
                        useAppThemeStateProvider: _useAppThemeState,
                        usePasswordTextController: _usePasswordTextController),
                  ),
                  // Submit button
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
                              AuthStatus status =
                                  await _useAuthServices.signInWithEmail(
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
                                  color: _useAppThemeState
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
                  // Register text
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

/// [EmailAuthForm] provides 2 text fields for email, and password.
class EmailAuthForm extends HookWidget {
  const EmailAuthForm({
    Key? key,
    required ValueNotifier<GlobalKey<FormState>> useEmailFormKey,
    required TextEditingController useEmailTextController,
    required bool useAppThemeStateProvider,
    required TextEditingController usePasswordTextController,
  })  : _useEmailFormKey = useEmailFormKey,
        _useEmailTextController = useEmailTextController,
        _useAppThemeStateProvider = useAppThemeStateProvider,
        _usePasswordTextController = usePasswordTextController,
        super(key: key);

  final ValueNotifier<GlobalKey<FormState>> _useEmailFormKey;
  final bool _useAppThemeStateProvider;
  final TextEditingController _useEmailTextController;
  final TextEditingController _usePasswordTextController;

  @override
  Widget build(BuildContext context) {
    final _usePasswordObscured = useState<bool>(true);

    return Form(
      key: _useEmailFormKey.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Email text field
          TextFormField(
            controller: _useEmailTextController,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            validator: (value) => ValidatorService.validateEmail(value),
            decoration:
                AuthTextFieldDecoration.authTextField(_useAppThemeStateProvider)
                    .copyWith(hintText: "Email"),
          ),
          Column(
            children: <Widget>[
              // Password text field
              TextFormField(
                autocorrect: false,
                controller: _usePasswordTextController,
                obscureText: _usePasswordObscured.value,
                textCapitalization: TextCapitalization.none,
                validator: (value) => ValidatorService.validatePassword(value),
                decoration: AuthTextFieldDecoration.authTextField(
                        _useAppThemeStateProvider)
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
              // Reset password touchable text
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(NavigationRoutes.resetRoute);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
