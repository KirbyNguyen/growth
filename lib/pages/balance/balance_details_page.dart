import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BalanceDetailsPage extends HookWidget {
  const BalanceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance Details Page"),
      ),
      body: ElevatedButton(
        child: const Text("Test"),
        onPressed: () {},
      ),
    );
  }
}
