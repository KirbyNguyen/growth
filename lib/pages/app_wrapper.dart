import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/pages/home_page.dart';
import 'package:growth/pages/authentication/auth_options_page.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

class AppWrapper extends HookWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authState = useProvider(authStateProvider);
    return _authState.when(
      data: (value) {
        if (value != null) {
          return const HomePage();
        }
        return const AuthOptionsPage();
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (_, __) {
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
