import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/constants/nav_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/theme_provider.dart';

import 'package:growth/constants/auth_status.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/services/validator_services.dart';
import 'package:growth/styles/auth_text_field_styles.dart';
import 'package:growth/components/custom_error_dialog.dart';

class EmailSignInForm extends HookConsumerWidget {
  const EmailSignInForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState<bool>(false);
    final passwordHidden = useState<bool>(true);
    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final authService = ref.watch(authServicesProvider);

    final emailSignInFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final emailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    return Form(
      key: emailSignInFormKey.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            autocorrect: false,
            controller: emailTextController,
            textCapitalization: TextCapitalization.none,
            validator: (value) => ValidatorServices.validateEmail(value),
            decoration: AuthTextFieldDecoration.authTextField(darkModeEnabled)
                .copyWith(hintText: "Email"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                controller: passwordTextController,
                obscureText: passwordHidden.value,
                textCapitalization: TextCapitalization.none,
                validator: (value) => ValidatorServices.validatePassword(value),
                decoration:
                    AuthTextFieldDecoration.authTextField(darkModeEnabled)
                        .copyWith(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0, 0),
                child: InkWell(
                  child: Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(NavigationRoutes.resetRoute);
                  },
                ),
              ),
            ],
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
                      "SIGN IN",
                      style: Theme.of(context).textTheme.headline5,
                    ),
              onPressed: () async {
                loading.value = true;

                if (emailSignInFormKey.value.currentState!.validate()) {
                  AuthStatus status = await authService.signInWithEmail(
                    email: emailTextController.text,
                    password: passwordTextController.text,
                  );

                  if (status != AuthStatus.successful) {
                    CustomErrorDialog errorDialog =
                        CustomErrorDialog(context: context);
                    await errorDialog.showError(status);
                  } else {
                    Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  }
                }

                loading.value = false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
