import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              AccountCard.addCard(
                function: () => Navigator.of(context).pushNamed(
                  NavigationRoutes.balanceAccountCreate,
                ),
                isDarkModeEnabled: _useAppThemeState,
              ),
              AccountCard(
                data: const Text("Edit an account"),
                function: () => Navigator.of(context).pushNamed(
                  NavigationRoutes.balanceAccountInfo,
                ),
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
