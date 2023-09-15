import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/auth/use_cases/current_app_user/current_app_user_notifier.dart';
import 'presentation/pages/auth_sign_in/auth_sign_in_page.dart';
import 'presentation/pages/main/main_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentAppUserNotifier);

    return MaterialApp(
      home: currentUser.isAuthenticated
          ? const MainPage()
          : const AuthSignInPage(),
    );
  }
}
