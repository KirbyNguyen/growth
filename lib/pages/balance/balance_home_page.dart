import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/components/account_card.dart';
import 'package:growth/components/custom_scaffold.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/theme_provider.dart';
import 'package:growth/providers/financial_account_provider.dart';

class BalanceHomePage extends HookConsumerWidget {
  const BalanceHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final darkModeEnabled = ref.watch(appThemeStateProvider);

    final accountList = ref.watch(accountProvider);
    final accountListNotifer = ref.watch(accountProvider.notifier);

    final dateSelected = useState<DateTime>(DateTime.now());
    final dateFormatter = useState<DateFormat>(DateFormat('yyyy-MM-dd'));

    List<Widget> buildAccountCards() {
      List<Widget> list = [];
      accountListNotifer.initialize(user.value!.uid);

      for (final account in accountList) {
        int iconPoint = ExistingTypeList.list
            .firstWhere((element) => element.id == account.typeID)
            .iconPoint;
        String iconFamily = ExistingTypeList.list
            .firstWhere((element) => element.id == account.typeID)
            .iconFamily;

        list.add(
          AccountCard(
            colorValue: account.colorValue,
            function: () => Navigator.of(context).pushNamed(
              NavigationRoutes.balanceAccountDetails,
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
            NavigationRoutes.balanceAccountCreate,
          ),
          isDarkModeEnabled: darkModeEnabled,
        ),
      );

      return list;
    }

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

    return CustomScaffold(
      title: "Balances",
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .pushNamed(NavigationRoutes.balanceTransactionCreate);
        },
      ),
      actions: const [],
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: buildAccountCards(),
          ),
        ),
        const Divider(),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () {
                      dateSelected.value = DateTime(
                        dateSelected.value.year,
                        dateSelected.value.month,
                        dateSelected.value.day - 1,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      selectTransactionDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        dateFormatter.value.format(dateSelected.value) ==
                                dateFormatter.value.format(DateTime.now())
                            ? "Today"
                            : dateFormatter.value.format(dateSelected.value),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(Icons.arrow_forward),
                    onTap: () {
                      dateSelected.value = DateTime(
                        dateSelected.value.year,
                        dateSelected.value.month,
                        dateSelected.value.day + 1,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
