import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/constants/nav_routes.dart';

class BalanceHomePage extends HookWidget {
  const BalanceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance Home Page"),
      ),
      body: ElevatedButton(
        child: const Text("Test"),
        onPressed: () {
          Navigator.of(context).pushNamed(NavigationRoutes.balanceDetailsRoute);
        },
      ),
    );
  }
}
