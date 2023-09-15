import 'package:flutter/material.dart';

class AuthSignInPage extends StatelessWidget {
  const AuthSignInPage({super.key});

  static const routeName = '/auth_sign_in';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AuthSignInPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('AuthSignInPage')),
    );
  }
}
