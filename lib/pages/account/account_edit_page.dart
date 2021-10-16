import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:growth/components/account_type_modal.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/balance_account.dart';

import 'package:growth/providers/account_provider.dart';
import 'package:growth/providers/app_theme_provider.dart';

import 'package:growth/services/validator_service.dart';

import 'package:growth/styles/text_field_style.dart';

class AccountEditPage extends HookWidget {
  const AccountEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account =
        ModalRoute.of(context)!.settings.arguments as BalanceAccount;

    final _useLoading = useState<bool>(false);
    final _useEditable = useState<bool>(false);
    final _usePickerColor = useState<Color>(Colors.white);
    final _useColor = useState<Color>(Color(account.colorValue));
    final _useAppThemeState = useProvider(appThemeStateProvider);
    final _useCurrencyFlag = useState<String>(account.currencyFlag);
    final _useAccountListNotifer = useProvider(accountProvider.notifier);
    final _useAccountType = useState<AccountType>(ExistingTypeList.list
        .firstWhere((element) => element.id == account.accountTypeId));

    final _useAccountEditFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final _useNameTextController = useTextEditingController
        .fromValue(TextEditingValue(text: account.name));
    final _useTypeTextController = useTextEditingController
        .fromValue(TextEditingValue(text: _useAccountType.value.name));
    final _useCurrencyTextController = useTextEditingController
        .fromValue(TextEditingValue(text: account.currencyCode));
    final _useBalanceTextController = useTextEditingController
        .fromValue(TextEditingValue(text: account.balance.toString()));
    final _useColorTextController = useTextEditingController
        .fromValue(TextEditingValue(text: account.colorValue.toString()));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.80,
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Form(
              key: _useAccountEditFormKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Name text field
                  TextFormField(
                    enabled: _useEditable.value,
                    controller: _useNameTextController,
                    validator: ValidatorService.validate,
                    decoration: TextFieldDecoration.textField(_useAppThemeState)
                        .copyWith(
                      hintText: "Name",
                      prefixIcon: const Icon(Icons.drive_file_rename_outline),
                    ),
                  ),
                  // Type text field
                  GestureDetector(
                    // Set the account type and
                    // change corresponding text controller
                    onTap: () async {
                      if (_useEditable.value) {
                        _useAccountType.value =
                            await AccountTypeModal().showModal(context);
                        _useTypeTextController.text =
                            _useAccountType.value.name;
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          enabled: _useEditable.value,
                          controller: _useTypeTextController,
                          validator: ValidatorService.validate,
                          decoration:
                              TextFieldDecoration.textField(_useAppThemeState)
                                  .copyWith(
                            hintText: "Type",
                            prefixIcon: Icon(
                              IconData(_useAccountType.value.iconPoint,
                                  fontFamily: _useAccountType.value.iconFamily),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Currency text field
                  GestureDetector(
                    onTap: () {
                      if (_useEditable.value) {
                        showCurrencyPicker(
                          context: context,
                          showFlag: true,
                          showCurrencyName: true,
                          showCurrencyCode: true,
                          onSelect: (Currency currency) {
                            _useCurrencyTextController.text = currency.code;
                            _useCurrencyFlag.value = currency.flag;
                          },
                        );
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          enabled: _useEditable.value,
                          controller: _useCurrencyTextController,
                          validator: ValidatorService.validate,
                          decoration:
                              TextFieldDecoration.textField(_useAppThemeState)
                                  .copyWith(
                            hintText: "Currency",
                            prefixIcon: _useCurrencyFlag.value != ""
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      CurrencyUtils.currencyToEmoji(
                                        Currency(
                                          flag: _useCurrencyFlag.value,
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
                    enabled: _useEditable.value,
                    controller: _useBalanceTextController,
                    validator: ValidatorService.validateNumeric,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: TextFieldDecoration.textField(_useAppThemeState)
                        .copyWith(
                      hintText: "Balance",
                      prefixIcon: const Icon(Icons.paid),
                    ),
                  ),
                  // Color text field
                  GestureDetector(
                    onTap: () {
                      if (_useEditable.value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0.0),
                              contentPadding: const EdgeInsets.all(0.0),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: _usePickerColor.value,
                                  onColorChanged: (Color color) =>
                                      _usePickerColor.value = color,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    _useColor.value = _usePickerColor.value;
                                    _useColorTextController.text =
                                        _useColor.value.value.toString();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          enabled: _useEditable.value,
                          controller: _useColorTextController,
                          validator: ValidatorService.validate,
                          style: TextStyle(
                            color: Color(_useColor.value.value),
                          ),
                          decoration:
                              TextFieldDecoration.textField(_useAppThemeState)
                                  .copyWith(
                            hintText: "Color",
                            prefixIcon: Icon(
                              Icons.palette,
                              color: Color(_useColor.value.value),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Submit button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _useEditable.value
                          ? ElevatedButton(
                              onPressed: () async {
                                _useLoading.value = true;
                                BalanceAccount newVersion = BalanceAccount(
                                  id: account.id,
                                  userId: account.userId,
                                  accountTypeId: _useAccountType.value.id,
                                  name: _useNameTextController.text,
                                  balance: double.parse(
                                      _useBalanceTextController.text),
                                  currencyFlag: _useCurrencyFlag.value,
                                  currencyCode: _useCurrencyTextController.text,
                                  colorValue:
                                      int.parse(_useColorTextController.text),
                                );
                                try {
                                  await _useAccountListNotifer
                                      .update(newVersion);
                                } catch (error) {
                                  // print(error);
                                }
                                _useEditable.value = false;
                                _useLoading.value = false;
                              },
                              child: _useLoading.value
                                  ? CircularProgressIndicator(
                                      color: _useAppThemeState
                                          ? CustomColors.canvasLight
                                          : CustomColors.canvasDark,
                                    )
                                  : const Text("CONFIRM"),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                _useEditable.value = true;
                              },
                              child: const Text("EDIT"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return _useAppThemeState
                                        ? CustomColors.unfocusedErrorDark
                                        : CustomColors.unfocusedErrorLight;
                                  },
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: () async {
                          await _useAccountListNotifer.delete(account.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text("DELETE"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return _useAppThemeState
                                  ? CustomColors.errorDark
                                  : CustomColors.errorLight;
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
