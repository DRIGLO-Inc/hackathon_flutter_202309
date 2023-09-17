import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/sign_in/sign_in.dart';
import '../../widgets/buttons/theme_switcher_button.dart';
import '../../widgets/snack_bars/floating_snack_bar.dart';
import '../../widgets/unfocus_gesture_detector.dart';

class AuthSignInPage extends ConsumerStatefulWidget {
  const AuthSignInPage({super.key});

  static const routeName = '/auth_sign_in';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AuthSignInPage(),
    );
  }

  @override
  ConsumerState<AuthSignInPage> createState() => _AuthSignInPageState();
}

class _AuthSignInPageState extends ConsumerState<AuthSignInPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  Future<void> _onPressed() async {
    try {
      await ref.read(signInProvider)(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
    } on Exception catch (_) {
      if (mounted) {
        // TODO(tsuda): エラーの種類によって、メッセージを出し分ける
        FloatingSnackBar.showError(context, message: 'サインインに失敗しました');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusGestureDetector(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 16,
                  right: 0,
                  child: ThemeSwitcherButton(),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordTextController,
                        decoration: const InputDecoration(
                          label: Text('Password'),
                        ),
                        onFieldSubmitted: (_) {
                          _onPressed();
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: _onPressed,
                        child: const Text('送信'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
