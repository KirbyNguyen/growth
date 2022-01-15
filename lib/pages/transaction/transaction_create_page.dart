import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/models/financial_transaction.dart';
import 'package:growth/models/account_type.dart';
import 'package:growth/models/financial_account.dart';

import 'package:growth/providers/theme_provider.dart';
import 'package:growth/providers/financial_account_provider.dart';
import 'package:growth/providers/financial_transaction_provider.dart';

import 'package:growth/components/account_modal.dart';
import 'package:growth/styles/text_field_styles.dart';
import 'package:growth/services/validator_services.dart';

class TransactionCreatePage extends HookConsumerWidget {
  const TransactionCreatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountList = ref.watch(accountProvider);
    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final accountListNotifer = ref.watch(accountProvider.notifier);
    final transactionListNotifer = ref.watch(transactionProvider.notifier);

    final expense = useState<bool>(true);
    final loading = useState<bool>(false);
    final accountType = useState<AccountType?>(null);
    final account = useState<FinancialAccount?>(null);
    final transactionFormKey =
        useState<GlobalKey<FormState>>(GlobalKey<FormState>());

    final dateSelected = useState<DateTime>(DateTime.now());
    final timeSelected = useState<TimeOfDay>(TimeOfDay.now());
    final dateFormatter = useState<DateFormat>(DateFormat('yyyy-MM-dd'));

    final amountTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final accountTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final methodTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final noteTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final dateTextController = useTextEditingController.fromValue(
      TextEditingValue(
        text: dateFormatter.value.format(dateSelected.value),
      ),
    );
    final timeTextController = useTextEditingController.fromValue(
      TextEditingValue(
        text: timeSelected.value.hour.toString() +
            " : " +
            timeSelected.value.minute.toString(),
      ),
    );

    Future<void> selectTransactionDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateSelected.value,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101),
      );
      if (picked != null) dateSelected.value = picked;
    }

    Future<void> selectTransactionTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
          context: context, initialTime: timeSelected.value);
      if (picked != null) timeSelected.value = picked;
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transaction Create"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.80,
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Column(
              children: <Widget>[
                // Type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(account.value != null
                        ? account.value!.currencyCode
                        : "   "),
                    Radio(
                      value: true,
                      groupValue: expense.value,
                      onChanged: (value) {
                        expense.value = true;
                      },
                    ),
                    const Text(
                      "Expense",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Radio(
                      value: false,
                      groupValue: expense.value,
                      onChanged: (value) {
                        expense.value = false;
                      },
                    ),
                    const Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Form(
                    key: transactionFormKey.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Amount
                        TextFormField(
                          controller: amountTextController,
                          validator: ValidatorServices.validateNumeric,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Amount",
                            prefixIcon: const Icon(Icons.paid),
                          ),
                        ),
                        // Account text field
                        GestureDetector(
                          onTap: () async {
                            account.value =
                                await AccountModal().showModal(context, ref);
                            if (account.value != null) {
                              accountType.value =
                                  ExistingTypeList.list.firstWhere(
                                (element) =>
                                    element.id == account.value!.typeID,
                              );
                            }
                            accountTextController.text =
                                account.value?.name ?? "";
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: accountTextController,
                                validator: ValidatorServices.validateEmpty,
                                style: TextStyle(
                                  color: account.value != null
                                      ? Color(account.value!.colorValue)
                                      : Theme.of(context).unselectedWidgetColor,
                                ),
                                decoration: TextFieldDecoration.textField(
                                        darkModeEnabled)
                                    .copyWith(
                                  hintText: "Account",
                                  prefixIcon: account.value == null
                                      ? const Icon(Icons.help)
                                      : Icon(
                                          IconData(accountType.value!.iconPoint,
                                              fontFamily: accountType
                                                  .value!.iconFamily),
                                          color:
                                              Color(account.value!.colorValue),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Method text field
                        TextFormField(
                          controller: methodTextController,
                          validator: ValidatorServices.validateEmpty,
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Method",
                            prefixIcon: const Icon(Icons.help),
                          ),
                        ),
                        // Date Picker
                        GestureDetector(
                          onTap: () async {
                            await selectTransactionDate(context);
                            dateTextController.text =
                                dateFormatter.value.format(dateSelected.value);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: dateTextController,
                                validator: ValidatorServices.validateEmpty,
                                decoration: TextFieldDecoration.textField(
                                        darkModeEnabled)
                                    .copyWith(
                                  hintText: "Date",
                                  prefixIcon: const Icon(Icons.date_range),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Time Picker
                        GestureDetector(
                          onTap: () async {
                            await selectTransactionTime(context);
                            timeTextController.text =
                                timeSelected.value.hour.toString() +
                                    " : " +
                                    timeSelected.value.minute.toString();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: timeTextController,
                                validator: ValidatorServices.validateEmpty,
                                decoration: TextFieldDecoration.textField(
                                        darkModeEnabled)
                                    .copyWith(
                                  hintText: "Time",
                                  prefixIcon: const Icon(Icons.timer),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Note text field
                        TextFormField(
                          controller: noteTextController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration:
                              TextFieldDecoration.textField(darkModeEnabled)
                                  .copyWith(
                            hintText: "Note",
                            prefixIcon: const Icon(Icons.note),
                          ),
                        ),
                        // Submit button
                        ElevatedButton(
                          onPressed: () async {
                            loading.value = true;
                            if (transactionFormKey.value.currentState!
                                .validate()) {
                              FinancialTransaction transaction =
                                  FinancialTransaction(
                                id: const Uuid().v4(),
                                uid: account.value!.uid,
                                accountID: account.value!.id,
                                expense: expense.value,
                                amount: double.parse(amountTextController.text),
                                note: noteTextController.text,
                                method: methodTextController.text,
                                date: DateTime(
                                  dateSelected.value.year,
                                  dateSelected.value.month,
                                  dateSelected.value.day,
                                  timeSelected.value.hour,
                                  timeSelected.value.minute,
                                ),
                                dateCreated: DateTime.now(),
                                dateEdited: DateTime.now(),
                              );

                              FinancialAccount newAccount =
                                  accountList.firstWhere((element) =>
                                      element.id == transaction.accountID);

                              if (expense.value) {
                                newAccount = newAccount.copyWith(
                                    balance: newAccount.balance -
                                        transaction.amount);
                              } else {
                                newAccount = newAccount.copyWith(
                                    balance: newAccount.balance +
                                        transaction.amount);
                              }
                              try {
                                await transactionListNotifer.add(transaction);
                                await accountListNotifer.update(newAccount);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
