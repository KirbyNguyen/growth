import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GardenDetailsPage extends HookWidget {
  const GardenDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garden Details Page"),
      ),
      body: ElevatedButton(
        child: const Text("Test"),
        onPressed: () {},
      ),
    );
  }
}
