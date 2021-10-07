import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/services/validator_service.dart';
import 'package:growth/styles/auth_text_field_style.dart';

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
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/reset");
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
