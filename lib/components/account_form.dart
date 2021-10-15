import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';

import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/account_type_modal.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/balance_account.dart';

import 'package:growth/providers/account_provider.dart';
import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

import 'package:growth/services/validator_service.dart';

import 'package:growth/styles/text_field_style.dart';

/// [AccountForm] provides a [Form] to create a new balance account.
class AccountForm extends HookWidget {
  const AccountForm({
    Key? key,
    required TextEditingController useNameTextController,
    required ValueNotifier<AccountType?> useAccountType,
    required TextEditingController useTypeTextController,
    required ValueNotifier<String?> useCurrencyFlag,
    required TextEditingController useCurrencyTextController,
    required TextEditingController useBalanceTextController,
    required TextEditingController useColorTextController,
  })  : _useNameTextController = useNameTextController,
        _useAccountType = useAccountType,
        _useTypeTextController = useTypeTextController,
        _useCurrencyFlag = useCurrencyFlag,
        _useCurrencyTextController = useCurrencyTextController,
        _useBalanceTextController = useBalanceTextController,
        _useColorTextController = useColorTextController,
        super(key: key);

  final TextEditingController _useNameTextController;
  final ValueNotifier<AccountType?> _useAccountType;
  final TextEditingController _useTypeTextController;
  final ValueNotifier<String?> _useCurrencyFlag;
  final TextEditingController _useCurrencyTextController;
  final TextEditingController _useBalanceTextController;
  final TextEditingController _useColorTextController;

  @override
  Widget build(BuildContext context) {
    final _useAccountListNotifer = useProvider(accountProvider.notifier);

    final _useAccountFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useLoading = useState<bool>(false);

    final _useAppThemeState = useProvider(appThemeStateProvider);
    final _useAuthState = useProvider(authStateProvider);

    return Form(
      key: _useAccountFormKey.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Name text field
          TextFormField(
            controller: _useNameTextController,
            validator: ValidatorService.validate,
            decoration:
                TextFieldDecoration.textField(_useAppThemeState).copyWith(
              hintText: "Name",
              prefixIcon: const Icon(Icons.drive_file_rename_outline),
            ),
          ),
          // Type text field
          GestureDetector(
            // Set the account type and
            // change corresponding text controller
            onTap: () async {
              _useAccountType.value =
                  await AccountTypeModal().showModal(context) ??
                      _useAccountType.value;

              _useTypeTextController.text = _useAccountType.value != null
                  ? _useAccountType.value!.name
                  : "";
            },
            child: Container(
              color: Colors.transparent,
              child: IgnorePointer(
                child: TextFormField(
                  controller: _useTypeTextController,
                  validator: ValidatorService.validate,
                  decoration:
                      TextFieldDecoration.textField(_useAppThemeState).copyWith(
                    hintText: "Type",
                    prefixIcon: _useAccountType.value == null
                        ? const Icon(Icons.help)
                        : Icon(
                            IconData(_useAccountType.value!.iconPoint,
                                fontFamily: _useAccountType.value!.iconFamily),
                          ),
                  ),
                ),
              ),
            ),
          ),
          // Currency text field
          GestureDetector(
            onTap: () => showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                _useCurrencyTextController.text = currency.code;
                _useCurrencyFlag.value = currency.flag;
              },
            ),
            child: Container(
              color: Colors.transparent,
              child: IgnorePointer(
                child: TextFormField(
                  controller: _useCurrencyTextController,
                  validator: ValidatorService.validate,
                  decoration:
                      TextFieldDecoration.textField(_useAppThemeState).copyWith(
                    hintText: "Currency",
                    prefixIcon: _useCurrencyFlag.value != null
                        ? Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
                            child: Text(
                              CurrencyUtils.currencyToEmoji(
                                Currency(
                                  flag: _useCurrencyFlag.value!,
                                  code: _useCurrencyTextController.text,
                                  name: '',
                                  number: 1,
                                  symbol: '',
                                  namePlural: '',
                                  decimalDigits: 1,
                                  symbolOnLeft: true,
                                  decimalSeparator: ',',
                                  thousandsSeparator: '',
                                  spaceBetweenAmountAndSymbol: true,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                          )
                        : const Icon(Icons.local_atm),
                  ),
                ),
              ),
            ),
          ),
          // Balance text field
          TextFormField(
            controller: _useBalanceTextController,
            validator: ValidatorService.validateNumeric,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration:
                TextFieldDecoration.textField(_useAppThemeState).copyWith(
              hintText: "Balance",
              prefixIcon: const Icon(Icons.paid),
            ),
          ),
          // Color text field
          TextFormField(
            controller: _useColorTextController,
            validator: ValidatorService.validate,
            decoration:
                TextFieldDecoration.textField(_useAppThemeState).copyWith(
              hintText: "Color",
              prefixIcon: const Icon(Icons.palette),
            ),
          ),
          // Submit button
          ElevatedButton(
            onPressed: () async {
              _useLoading.value = true;
              if (_useAccountFormKey.value.currentState!.validate()) {
                BalanceAccount newAccounnt = BalanceAccount(
                  userId: _useAuthState.data!.value!.uid,
                  accountTypeId: _useAccountType.value!.id,
                  name: _useNameTextController.text,
                  balance: double.parse(_useBalanceTextController.text),
                  currencyFlag: _useCurrencyFlag.value!,
                  currencyCode: _useCurrencyTextController.text,
                  colorValue: int.parse(_useColorTextController.text),
                );
                try {
                  await _useAccountListNotifer.insert(newAccounnt);
                  Navigator.of(context).pop();
                } catch (error) {
                  print(error);
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
                : const Text("CREATE"),
          ),
        ],
      ),
    );
  }
}
