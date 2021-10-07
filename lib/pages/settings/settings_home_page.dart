import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

class SettingsHomePage extends HookWidget {
  const SettingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAuthServicesProvider = useProvider(authServicesProvider);

    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);
    final _useAppThemeProvider = useProvider(appThemeStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 10.0),
                    const Text("Dark Mode"),
                    Switch(
                      onChanged: (bool value) {
                        _useAppThemeProvider.toggleAppTheme(context);
                      },
                      value: _useAppThemeStateProvider,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    await _useAuthServicesProvider.signOut();
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.logout),
                      SizedBox(width: 10.0),
                      Text("Sign Out"),
                    ],
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
