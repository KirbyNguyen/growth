import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/financial_account.dart';

import 'package:growth/constants/custom_colors.dart';

import 'package:growth/components/account_type_modal.dart';

import 'package:growth/styles/text_field_styles.dart';

import 'package:growth/services/validator_services.dart';

import 'package:growth/providers/theme_provider.dart';
import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/financial_account_provider.dart';

class AccountCreatePage extends HookConsumerWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final authState = ref.watch(authStateProvider.originProvider);
    final accountListNotifer = ref.watch(accountProvider.notifier);

    final loading = useState<bool>(false);

    final accountType = useState<AccountType?>(null);
    
    final pickedColor = useState<Color?>(null);
    final pickerColor = useState<Color>(Colors.white);

    final accountFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final typeTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final currencyTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final balanceTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final colorTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account Create"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.80,
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Form(
              key: accountFormKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Name text field
                  TextFormField(
                    controller: nameTextController,
                    validator: ValidatorServices.validateEmpty,
                    decoration:
                        TextFieldDecoration.textField(darkModeEnabled).copyWith(
                      hintText: "Name",
                      prefixIcon: const Icon(Icons.drive_file_rename_outline),
                    ),
                  ),
                  // Type text field
                  GestureDetector(
                    // Set the account type and
                    // change corresponding text controller
                    onTap: () async {
                      accountType.value =
                          await AccountTypeModal().showModal(context);
                      typeTextController.text =
                          accountType.value?.name ?? "";
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: typeTextController,
                          validator: ValidatorServices.validateEmpty,
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Type",
                            prefixIcon: accountType.value == null
                                ? const Icon(Icons.help)
                                : Icon(
                                    IconData(accountType.value!.iconPoint,
                                        fontFamily:
                                            accountType.value!.iconFamily),
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
                        currencyTextController.text = currency.code;
                      },
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: currencyTextController,
                          validator: ValidatorServices.validateEmpty,
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Currency",
                            prefixIcon: const Icon(Icons.local_atm),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Balance text field
                  TextFormField(
                    controller: balanceTextController,
                    validator: ValidatorServices.validateNumeric,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: TextFieldDecoration.textField(darkModeEnabled)
                        .copyWith(
                      hintText: "Balance",
                      prefixIcon: const Icon(Icons.paid),
                    ),
                  ),
                  // Color text field
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: const EdgeInsets.all(0.0),
                            contentPadding: const EdgeInsets.all(0.0),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: pickerColor.value,
                                onColorChanged: (Color color) =>
                                    pickerColor.value = color,
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('Got it'),
                                onPressed: () {
                                  pickedColor.value = pickerColor.value;
                                  colorTextController.text =
                                      pickedColor.value?.value.toString() ?? "";
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: colorTextController,
                          validator: ValidatorServices.validateEmpty,
                          style: TextStyle(
                            color: pickedColor.value != null
                                ? Color(pickedColor.value!.value)
                                : Theme.of(context).unselectedWidgetColor,
                          ),
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Color",
                            prefixIcon: Icon(
                              Icons.palette,
                              color: pickedColor.value != null
                                  ? Color(pickedColor.value!.value)
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Submit button
                  ElevatedButton(
                    onPressed: () async {
                      loading.value = true;
                      if (accountFormKey.value.currentState!.validate()) {
                        FinancialAccount newAccount = FinancialAccount(
                          id: const Uuid().v4(),
                          uid: authState.value!.uid,
                          typeID: accountType.value!.id,
                          name: nameTextController.text,
                          balance: double.parse(balanceTextController.text),
                          currencyCode: currencyTextController.text,
                          colorValue: int.parse(colorTextController.text), 
                        );
                        try {
                          await accountListNotifer.add(newAccount);
                          Navigator.of(context).pop();
                        } catch (error) {
                          // print(error);
                        }
                      }
                      loading.value = false;
                    },
                    child: loading.value
                        ? CircularProgressIndicator(
                            color: darkModeEnabled
                                ? CustomColors.canvasLight
                                : CustomColors.canvasDark,
                          )
                        : const Text("CREATE"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
