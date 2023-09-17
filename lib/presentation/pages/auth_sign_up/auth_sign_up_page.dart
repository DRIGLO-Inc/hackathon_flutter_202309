import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/sign_up/sign_up.dart';
import '../../widgets/buttons/obscure_text_switcher_button.dart';
import '../../widgets/buttons/theme_switcher_button.dart';
import '../../widgets/snack_bars/floating_snack_bar.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import '../auth_sign_in/auth_sign_in_page.dart';
import '../main/main_page.dart';

class AuthSignUpPageArgs extends Equatable {
  const AuthSignUpPageArgs({required this.email, required this.password});

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

class AuthSignUpPage extends ConsumerStatefulWidget {
  const AuthSignUpPage._(this.args);

  final AuthSignUpPageArgs args;

  static const routeName = '/auth_sign_up';

  static Route<void> route(AuthSignUpPageArgs args) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AuthSignUpPage._(args),
    );
  }

  @override
  ConsumerState<AuthSignUpPage> createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends ConsumerState<AuthSignUpPage> {
  late final _emailTextController =
      TextEditingController(text: widget.args.email);
  late final _passwordTextController =
      TextEditingController(text: widget.args.password);

  var _obscurePassword = true;

  Future<void> _onPressed() async {
    try {
      await ref.read(signUpProvider)(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      if (mounted) {
        unawaited(Navigator.of(context).push(MainPage.route()));
      }
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
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        decoration: const InputDecoration(
                          label: Text('Email'),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordTextController,
                        autofillHints: const [AutofillHints.newPassword],
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          suffixIcon: ObscureTextSwitcherButton(
                            obscure: _obscurePassword,
                            onChanged: (value) => setState(() {
                              _obscurePassword = value;
                            }),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        onFieldSubmitted: (_) {
                          _onPressed();
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: _onPressed,
                        child: const Text('登録'),
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).replace(
                            oldRoute: ModalRoute.of(context)!,
                            newRoute: AuthSignInPage.route(
                              AuthSignInPageArgs(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              ),
                            ),
                          );
                        },
                        child: const Text('アカウントをすでにお持ちの方'),
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
