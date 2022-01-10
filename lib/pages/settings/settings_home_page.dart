import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/components/custom_scaffold.dart';

import 'package:growth/providers/auth_provider.dart';
import 'package:growth/providers/theme_provider.dart';

class SettingsHomePage extends HookConsumerWidget {
  const SettingsHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authServices = ref.watch(authServicesProvider);

    final darkModeEnabled = ref.watch(appThemeStateProvider);
    final darkModeNotifier = ref.watch(appThemeStateProvider.notifier);

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
                  await authServices.signOut();
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: darkModeEnabled
                          ? CustomColors.errorDark
                          : CustomColors.errorLight,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "Sign Out",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: darkModeEnabled
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
                      darkModeNotifier.toggleAppTheme(context, ref);
                    },
                    value: darkModeEnabled,
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
