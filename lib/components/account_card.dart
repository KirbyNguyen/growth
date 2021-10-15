import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/styles/account_card_style.dart';

/// [AccountCard] creates a card in [BalanceHomePage]. It should take a [Widget]
/// as information for the card, and a [void Function()] to navigate to a proper
/// screen.
class AccountCard extends HookWidget {
  AccountCard({Key? key, required data, required function, required colorValue})
      : super(key: key) {
    _data = data;
    _function = function;
    _borderDecoration = AccountCardStyle.normalCard(colorValue);
  }

  AccountCard.addCard({Key? key, required isDarkModeEnabled, required function})
      : super(key: key) {
    _data = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.add_circle,
          color: isDarkModeEnabled
              ? CustomColors.primaryLight
              : CustomColors.primaryDark,
          size: 45.0,
        ),
        const Text(
          "Add new\naccount",
          textAlign: TextAlign.center,
        ),
      ],
    );
    _function = function;
    _borderDecoration = AccountCardStyle.addAccountCard(isDarkModeEnabled);
  }

  late final Widget _data;
  late final void Function() _function;
  late final BoxDecoration _borderDecoration;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: _function,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.35,
        decoration: _borderDecoration,
        child: _data,
      ),
    );
  }
}
