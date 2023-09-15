import 'package:flutter/material.dart';

class AuthSignUpPage extends StatelessWidget {
  const AuthSignUpPage._();

  static const routeName = '/auth_sign_up';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AuthSignUpPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('AuthSignUpPage')),
    );
  }
}
