import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/pages/garden/garden_home_page.dart';

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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const GardenHomePage(),
            ),
          );
        },
      ),
    );
  }
}
