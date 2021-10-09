import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:growth/components/custom_scaffold.dart';
import 'package:growth/constants/custom_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/firebase_auth_provider.dart';

class SettingsHomePage extends HookWidget {
  const SettingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useAuthServices = useProvider(authServicesProvider);

    final _useAppThemeState = useProvider(appThemeStateProvider);
    final _useAppThemeNotifier = useProvider(appThemeStateProvider.notifier);

    return CustomScaffold(
      title: "Settings",
      actions: const [],
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () async {
                  await _useAuthServices.signOut();
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: _useAppThemeState
                          ? CustomColors.errorDark
                          : CustomColors.errorLight,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "Sign Out",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: _useAppThemeState
                                ? CustomColors.errorDark
                                : CustomColors.errorLight,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.dark_mode),
                  const SizedBox(width: 10.0),
                  const Text("Dark Mode"),
                  Switch(
                    onChanged: (bool value) {
                      _useAppThemeNotifier.toggleAppTheme(context);
                    },
                    value: _useAppThemeState,
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ],
    );
  }
}
