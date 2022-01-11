import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/components/custom_scaffold.dart';

class BalanceHomePage extends HookConsumerWidget {
  const BalanceHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      title: "Balances",
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      actions: const [],
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: const <Widget>[],
        ),
      ],
    );
  }
}
