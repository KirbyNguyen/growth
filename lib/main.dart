import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:growth/constants/nav_routes.dart';
import 'package:growth/providers/app_theme_provider.dart';
import 'package:growth/providers/shared_preferences_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _useAppTheme = useProvider(appThemeProvider);
    final _useAppThemeState = useProvider(appThemeStateProvider);

    return MaterialApp(
      title: "Growth",
      theme: _useAppTheme.getThemeData(context, _useAppThemeState),
      routes: NavigationRoutes.navRoutes,
      initialRoute: NavigationRoutes.blankRoute,
    );
  }
}
