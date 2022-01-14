import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/styles/auth_text_field_styles.dart';

import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/theme_provider.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/services/validator_services.dart';

class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServicesProvider);
    final darkModeEnabled = ref.watch(appThemeStateProvider);

    final loading = useState<bool>(false);

    final passwordResetFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final emailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

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
          title: const Text("Reset Password"),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/password_reset.png",
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Text(
                      "Forget your password?",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "Enter your email, and follow the instructions",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      flex: 3,
                      child: Form(
                        key: passwordResetFormKey.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              autocorrect: false,
                              controller: emailTextController,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) =>
                                  ValidatorServices.validateEmail(value),
                              decoration: AuthTextFieldDecoration.authTextField(
                                      darkModeEnabled)
                                  .copyWith(hintText: "Email"),
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
                                        "RESET",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                onPressed: () async {
                                  loading.value = true;
                                  if (passwordResetFormKey.value.currentState!
                                      .validate()) {
                                    await authService.sendPasswordResetEmail(
                                        emailTextController.text);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AlertDialog(
                                          title: Text("Email sent!"),
                                          content: Text(
                                              "Please check your email for the instructions."),
                                        );
                                      },
                                    );
                                    Navigator.of(context).pop();
                                  }
                                  loading.value = false;
                                },
                              ),
                            ),
                          ],
                        ),
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
