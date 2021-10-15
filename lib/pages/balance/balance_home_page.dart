import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/constants/existing_type_list.dart';
import 'package:growth/providers/firebase_auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/components/account_card.dart';
import 'package:growth/components/custom_scaffold.dart';

import 'package:growth/constants/nav_routes.dart';

import 'package:growth/providers/account_provider.dart';
import 'package:growth/providers/app_theme_provider.dart';

class BalanceHomePage extends HookWidget {
  const BalanceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authState = useProvider(authStateProvider);
    final _useAppThemeState = useProvider(appThemeStateProvider);

    final _useAccountList = useProvider(accountProvider);
    final _useAccountListNotifer = useProvider(accountProvider.notifier);

    /// Build [List] of [Widget] to display a list of account
    List<Widget> _buildAccountCard() {
      List<Widget> list = [];
      _useAccountListNotifer.setList(_authState.data!.value!.uid);

      for (final account in _useAccountList) {
        int iconPoint = ExistingTypeList.list
            .firstWhere((element) => element.id == account.accountTypeId)
            .iconPoint;
        String iconFamily = ExistingTypeList.list
            .firstWhere((element) => element.id == account.accountTypeId)
            .iconFamily;

        list.add(
          AccountCard(
            colorValue: account.colorValue,
            function: () => Navigator.of(context).pushNamed(
              NavigationRoutes.balanceAccount,
              arguments: account,
            ),
            data: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  IconData(iconPoint, fontFamily: iconFamily),
                  size: 45.0,
                  color: Color(account.colorValue),
                ),
                Text(
                  account.name,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Color(account.colorValue),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  account.balance.toString() + " " + account.currencyCode,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Color(account.colorValue),
                    fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
                  ),
                ),
              ],
            ),
          ),
        );
        list.add(
          const SizedBox(
            width: 20.0,
          ),
        );
      }

      list.add(
        AccountCard.addCard(
          function: () => Navigator.of(context).pushNamed(
            NavigationRoutes.balanceAccount,
          ),
          isDarkModeEnabled: _useAppThemeState,
        ),
      );

      return list;
    }

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
            children: _buildAccountCard(),
          ),
        ),
        const Divider(),
        const Text("Nothing is here"),
      ],
    );
  }
}
