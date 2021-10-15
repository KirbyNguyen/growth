import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/models/balance_account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/components/account_card.dart';
import 'package:growth/components/custom_scaffold.dart';

import 'package:growth/constants/nav_routes.dart';

import 'package:growth/providers/app_theme_provider.dart';

class BalanceHomePage extends HookWidget {
  const BalanceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAppThemeState = useProvider(appThemeStateProvider);

    return CustomScaffold(
      title: "Balance",
      actions: const [],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              AccountCard.addCard(
                function: () => Navigator.of(context).pushNamed(
                  NavigationRoutes.balanceAccount,
                  arguments: BalanceAccount(
                      id: 'id',
                      userId: 'userId',
                      accountTypeId: "GENERIC_CASH",
                      name: "Cash",
                      balance: 500.0,
                      currencyFlag: "USD",
                      currencyCode: "USD",
                      colorValue: 12312312),
                ),
                isDarkModeEnabled: _useAppThemeState,
              ),
            ],
          ),
        ),
        const Divider(),
        const Text("Nothing is here"),
      ],
    );
  }
}
