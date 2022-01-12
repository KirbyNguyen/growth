import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/app_theme.dart';
import 'package:growth/providers/preferences_provider.dart';

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final darkModeEnabled = ref.read(sharedUtilityProvider).isDarkModeEnabled();
  return AppThemeNotifier(darkModeEnabled);
});

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.defaultDarkModeEnabled) : super(defaultDarkModeEnabled);

  final bool defaultDarkModeEnabled;

  void toggleAppTheme(BuildContext context, WidgetRef ref) {
    final _darkModeEnabled =
        ref.read(sharedUtilityProvider).isDarkModeEnabled();
    final _toggleValue = !_darkModeEnabled;

    ref
        .read(
          sharedUtilityProvider,
        )
        .setDarkModeEnabled(_toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
