import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:growth/components/account_form.dart';

import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/balance_account.dart';

class AccountInfoPage extends HookWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BalanceAccount?;

    final _useNameTextController = useTextEditingController.fromValue(
        args != null
            ? TextEditingValue(text: args.name)
            : TextEditingValue.empty);

    AccountType? _findAccount() {
      if (args != null) {
        return ExistingTypeList.list.firstWhere(
          (item) => item.id == args.accountTypeId,
        );
      }
      return null;
    }

    final _useAccountType = useState<AccountType?>(_findAccount());

    final _useTypeTextController = useTextEditingController
        .fromValue(TextEditingValue(text: _findAccount()?.name ?? ""));

    final _useCurrencyTextController = useTextEditingController.fromValue(
        args != null
            ? TextEditingValue(text: args.currencyCode)
            : TextEditingValue.empty);
    final _useCurrencyFlag = useState<String?>(args?.currencyFlag);

    final _useBalanceTextController = useTextEditingController.fromValue(
        args != null
            ? TextEditingValue(text: args.balance.toString())
            : TextEditingValue.empty);

    final _useColorTextController = useTextEditingController.fromValue(
        args != null
            ? TextEditingValue(text: args.colorValue.toString())
            : TextEditingValue.empty);

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
            child: AccountForm(
              useNameTextController: _useNameTextController,
              useAccountType: _useAccountType,
              useTypeTextController: _useTypeTextController,
              useCurrencyFlag: _useCurrencyFlag,
              useCurrencyTextController: _useCurrencyTextController,
              useBalanceTextController: _useBalanceTextController,
              useColorTextController: _useColorTextController,
            ),
          ),
        ),
      ),
    );
  }
}
