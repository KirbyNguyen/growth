import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GardenHomePage extends HookWidget {
  const GardenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Garden Home Page"),
      ),
      body: ElevatedButton(
        child: const Text("Test"),
        onPressed: () {
          Navigator.of(context).pushNamed("/settings");
        },
      ),
    );
  }
}
