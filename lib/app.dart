import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/auth/use_cases/initialize_app/initialize_app.dart';
import 'domain/auth/use_cases/initialize_app/initialize_app_status.dart';
import 'presentation/pages/auth_sign_in/auth_sign_in_page.dart';
import 'presentation/pages/main/main_page.dart';
import 'presentation/providers/theme_switcher_notifier.dart';
import 'presentation/theme/global_keys.dart';
import 'presentation/theme/theme_data.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializeAppStatus = ref.watch(initializeAppProvider).valueOrNull;
    final themeMode = ref.watch(themeSwitcherNotifierProvider);

    final home = switch (initializeAppStatus) {
      InitializeAppStatus.noAuth => const AuthSignInPage(AuthSignInPageArgs()),
      InitializeAppStatus.completed => const MainPage(),
      _ => const Scaffold()
    };

    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      themeMode: themeMode,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: home,
    );
  }
}
