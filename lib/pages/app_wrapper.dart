import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/auth_provider.dart';

import 'package:growth/pages/home_page.dart';
import 'package:growth/pages/authentication/auth_options_page.dart';

class AppWrapper extends HookConsumerWidget {
  const AppWrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.read(authStateProvider);
    return authState.when(
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
