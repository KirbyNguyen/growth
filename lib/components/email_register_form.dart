import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:growth/services/validator_service.dart';
import 'package:growth/styles/auth_text_field_style.dart';

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
