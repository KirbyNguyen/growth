import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/styles/auth_text_field_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/auth_decoration.dart';
import 'package:growth/components/sign_up_test.dart';
import 'package:growth/providers/app_theme_provider.dart';

class EmailAuthPage extends HookWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);

    final _useEmailFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useEmailTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final _usePasswordTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

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
                    child: Form(
                      key: _useEmailFormKey.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextFormField(
                            autocorrect: false,
                            controller: _useEmailTextController,
                            textCapitalization: TextCapitalization.none,
                            decoration: AuthTextFieldDecoration.authTextField(
                                    _useAppThemeStateProvider)
                                .copyWith(hintText: "Email"),
                          ),
                          Column(
                            children: <Widget>[
                              TextFormField(
                                autocorrect: false,
                                controller: _usePasswordTextController,
                                textCapitalization: TextCapitalization.none,
                                decoration:
                                    AuthTextFieldDecoration.authTextField(
                                            _useAppThemeStateProvider)
                                        .copyWith(hintText: "Password"),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      "Reset Password",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Sign In"),
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
