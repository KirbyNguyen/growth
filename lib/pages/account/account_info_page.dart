import 'package:growth/components/account_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:currency_picker/currency_picker.dart';

import 'package:growth/models/account_type.dart';

class AccountInfoPage extends HookWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    final _useNameTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final _useTypeTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    var _useAccountType = useState<AccountType?>(null);

    final _useCurrencyTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    var _useCurrency = useState<Currency?>(null);

    final _useBalanceTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final _useColorTextController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.80,
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: AccountForm(
            useNameTextController: _useNameTextController,
            useAccountType: _useAccountType,
            useTypeTextController: _useTypeTextController,
            useCurrency: _useCurrency,
            useCurrencyTextController: _useCurrencyTextController,
            useBalanceTextController: _useBalanceTextController,
            useColorTextController: _useColorTextController,
          ),
        ),
      ),
    );
  }
}

