import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: _sharedPrefs);
});

/// Shared Utility class that holds information such as [isDarkModeEnabled].
class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  /// Returns if [isDarkModeEnabled] as a [bool].
  bool isDarkModeEnabled() {
    return sharedPreferences.getBool('isDarkModeEnabled') ?? false;
  }

  /// Sets [isDarkModeEnabled].
  Future<bool> setDarkModeEnabled(bool value) async {
    return await sharedPreferences.setBool('isDarkModeEnabled', value);
  }
}
