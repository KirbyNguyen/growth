import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:growth/providers/theme_provider.dart';
import 'package:growth/providers/preferences_provider.dart';
import 'package:growth/pages/authentication/email_sign_up_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appTheme = ref.watch(appThemeProvider);
    final _appThemeState = ref.watch(appThemeStateProvider);

    return MaterialApp(
      title: "Growth",
      theme: _appTheme.getThemeData(context, _appThemeState),
      home: const EmailSignUpPage(),
    );
  }
}
