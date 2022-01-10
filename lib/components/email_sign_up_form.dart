import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/theme_provider.dart';

import 'package:growth/components/custom_error_dialog.dart';
import 'package:growth/components/terms_conditions_text.dart';

import 'package:growth/services/validator_services.dart';
import 'package:growth/styles/auth_text_field_styles.dart';

class EmailSignUpForm extends HookConsumerWidget {
  const EmailSignUpForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState<bool>(false);
    final passwordHidden = useState<bool>(true);
    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final authService = ref.watch(authServicesProvider);

    final emailRegisterFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final emailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final confirmPasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Form(
      key: emailRegisterFormKey.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            autocorrect: false,
            controller: nameTextController,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorServices.validateDisplayName(value),
            decoration: AuthTextFieldDecoration.authTextField(darkModeEnabled)
                .copyWith(hintText: "Display Name"),
          ),
          TextFormField(
            autocorrect: false,
            controller: emailTextController,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorServices.validateEmail(value),
            decoration: AuthTextFieldDecoration.authTextField(darkModeEnabled)
                .copyWith(hintText: "Email"),
          ),
          TextFormField(
            autocorrect: false,
            controller: passwordTextController,
            obscureText: passwordHidden.value,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorServices.validatePassword(value),
            decoration:
                AuthTextFieldDecoration.authTextField(darkModeEnabled).copyWith(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  passwordHidden.value = !passwordHidden.value;
                },
                child: AuthTextFieldDecoration.passwordObscureIcon(
                    darkModeEnabled, passwordHidden.value),
              ),
            ),
          ),
          TextFormField(
            autocorrect: false,
            controller: confirmPasswordTextController,
            obscureText: passwordHidden.value,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              return ValidatorServices.validateConfirmPassword(
                  value, passwordTextController.text);
            },
            decoration:
                AuthTextFieldDecoration.authTextField(darkModeEnabled).copyWith(
              hintText: "Confirm Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  passwordHidden.value = !passwordHidden.value;
                },
                child: AuthTextFieldDecoration.passwordObscureIcon(
                    darkModeEnabled, passwordHidden.value),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                "By signing up, you agree to our",
                style: Theme.of(context).textTheme.headline6,
              ),
              const TermsConditionsText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  child: loading.value
                      ? CircularProgressIndicator(
                          color: darkModeEnabled
                              ? CustomColors.canvasLight
                              : CustomColors.canvasDark,
                        )
                      : Text(
                          "SIGN UP",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                  onPressed: () async {
                    loading.value = true;
                    
                    if (emailRegisterFormKey.value.currentState!.validate()) {
                      AuthStatus status = await authService.signUpWithEmail(
                        email: emailTextController.text,
                        password: passwordTextController.text,
                        name: nameTextController.text,
                      );

                      if (status != AuthStatus.successful) {
                        CustomErrorDialog errorDialog =
                            CustomErrorDialog(context: context);
                        await errorDialog.showError(status);
                      } else {
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName("/"));
                      }
                    }

                    loading.value = false;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
