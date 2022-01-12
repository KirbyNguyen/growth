import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/financial_account.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/components/account_type_modal.dart';

import 'package:growth/styles/text_field_styles.dart';

import 'package:growth/services/validator_services.dart';

import 'package:growth/providers/theme_provider.dart';
import 'package:growth/providers/financial_account_provider.dart';

class AccountDetailsPage extends HookConsumerWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account =
        ModalRoute.of(context)!.settings.arguments as FinancialAccount;

    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final accountListNotifer = ref.watch(accountProvider.notifier);

    final loading = useState<bool>(false);
    final editable = useState<bool>(false);

    final accountType = useState<AccountType>(
      ExistingTypeList.list
          .firstWhere((element) => element.id == account.typeID),
    );

    final pickedColor = useState<Color?>(null);
    final pickerColor = useState<Color>(Colors.white);

    final accountFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final nameTextController = useTextEditingController.fromValue(
      TextEditingValue(text: account.name),
    );
    final typeTextController = useTextEditingController.fromValue(
      TextEditingValue(text: accountType.value.name),
    );
    final currencyTextController = useTextEditingController.fromValue(
      TextEditingValue(text: account.currencyCode),
    );
    final balanceTextController = useTextEditingController.fromValue(
      TextEditingValue(
        text: account.balance.toString(),
      ),
    );
    final colorTextController = useTextEditingController.fromValue(
      TextEditingValue(
        text: account.colorValue.toString(),
      ),
    );

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
                    enabled: editable.value,
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
                      if (editable.value) {
                        accountType.value =
                            await AccountTypeModal().showModal(context);
                        typeTextController.text = accountType.value.name;
                      }
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
                            prefixIcon: Icon(
                              IconData(
                                accountType.value.iconPoint,
                                fontFamily: accountType.value.iconFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Currency text field
                  GestureDetector(
                    onTap: () {
                      if (editable.value) {
                        showCurrencyPicker(
                          context: context,
                          showFlag: true,
                          showCurrencyName: true,
                          showCurrencyCode: true,
                          onSelect: (Currency currency) {
                            currencyTextController.text = currency.code;
                          },
                        );
                      }
                    },
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
                    enabled: editable.value,
                    controller: balanceTextController,
                    validator: ValidatorServices.validateNumeric,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration:
                        TextFieldDecoration.textField(darkModeEnabled).copyWith(
                      hintText: "Balance",
                      prefixIcon: const Icon(Icons.paid),
                    ),
                  ),
                  // Color text field
                  GestureDetector(
                    onTap: () {
                      if (editable.value) {
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
                                        pickedColor.value?.value.toString() ??
                                            "";
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      editable.value
                          ? ElevatedButton(
                              onPressed: () async {
                                loading.value = true;
                                FinancialAccount newVersion = FinancialAccount(
                                  id: account.id,
                                  uid: account.uid,
                                  typeID: accountType.value.id,
                                  name: nameTextController.text,
                                  balance:
                                      double.parse(balanceTextController.text),
                                  currencyCode: currencyTextController.text,
                                  colorValue:
                                      int.parse(colorTextController.text),
                                );
                                try {
                                  await accountListNotifer.update(newVersion);
                                } catch (error) {
                                  // print(error);
                                }
                                editable.value = false;
                                loading.value = false;
                              },
                              child: loading.value
                                  ? CircularProgressIndicator(
                                      color: darkModeEnabled
                                          ? CustomColors.canvasLight
                                          : CustomColors.canvasDark,
                                    )
                                  : const Text("CONFIRM"),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                editable.value = true;
                              },
                              child: const Text("EDIT"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return darkModeEnabled
                                        ? CustomColors.unfocusedErrorDark
                                        : CustomColors.unfocusedErrorLight;
                                  },
                                ),
                              ),
                            ),
                      ElevatedButton(
                        onPressed: () async {
                          await accountListNotifer.delete(account.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text("DELETE"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return darkModeEnabled
                                  ? CustomColors.errorDark
                                  : CustomColors.errorLight;
                            },
                          ),
                        ),
                      ),
                    ],
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
