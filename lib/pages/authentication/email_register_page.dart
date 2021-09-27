import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/components/terms_text.dart';
import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/components/email_register_form.dart';

/// Authentication page for email signup.
class EmailRegisterPage extends HookWidget {
  const EmailRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);

    final _useEmailFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useEmailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _usePasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _useConfirmPasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Sign Up")),
      body: Container(
        decoration:
            AuthDecoration.authGradientBackground(_useAppThemeStateProvider),
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
                          useEmailFormKey: _useEmailFormKey,
                          useEmailTextController: _useEmailTextController,
                          useAppThemeStateProvider: _useAppThemeStateProvider,
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
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("SIGN UP"),
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
