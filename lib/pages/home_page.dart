import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/firebase_auth_provider.dart';
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAuthServicesProvider = useProvider(authServicesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ElevatedButton(
        child: const Text("Sign Out"),
        onPressed: () async {
          await _useAuthServicesProvider.signOut();
        },
      ),
    );
  }
}
