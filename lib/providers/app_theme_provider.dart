import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/styles/app_theme.dart';
import 'package:growth/providers/shared_preferences_provider.dart';

/// Uses [riverpod] to provide [AppTheme].
final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

/// Uses [riverpod] to provider [AppThemeNotifer] with [isDarkModeEnabled].
final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkModeEnabled =
      ref.read(sharedUtilityProvider).isDarkModeEnabled();
  return AppThemeNotifier(_isDarkModeEnabled);
});

/// App Theme Notifer notifies that changes of [isDarkModeEnabled]
/// for [riverpod].
class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.defaultDarkModeValue) : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  /// Toggles light/dark theme with [sharedUtilityProvider].
  void toggleAppTheme(BuildContext context) {
    final _isDarkModeEnabled =
        context.read(sharedUtilityProvider).isDarkModeEnabled();
    final _toggleValue = !_isDarkModeEnabled;

    context
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
