import 'package:flutter/material.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/styles/account_card_style.dart';

/// [AccountCard] display the appropriate data in the main screen
class AccountCard extends StatelessWidget {
  AccountCard({
    Key? key,
    required data,
    required function,
    required colorValue,
  }) : super(key: key) {
    _data = data;
    _navigateFunction = function;
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
    _navigateFunction = function;
    _borderDecoration = AccountCardStyle.addAccountCard(isDarkModeEnabled);
  }

  late final Widget _data;
  late final void Function() _navigateFunction;
  late final BoxDecoration _borderDecoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateFunction,
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
