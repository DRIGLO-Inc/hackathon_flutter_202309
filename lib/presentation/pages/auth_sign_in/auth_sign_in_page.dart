import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/sign_in/sign_in.dart';
import '../../../utils/extensions/navigator_state_ex.dart';
import '../../widgets/buttons/obscure_text_switcher_button.dart';
import '../../widgets/buttons/theme_switcher_button.dart';
import '../../widgets/snack_bars/floating_snack_bar.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import '../auth_sign_up/auth_sign_up_page.dart';
import '../main/main_page.dart';

class AuthSignInPageArgs extends Equatable {
  const AuthSignInPageArgs({this.email, this.password});

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

class AuthSignInPage extends ConsumerStatefulWidget {
  const AuthSignInPage(this.args, {super.key});

  final AuthSignInPageArgs args;

  static const routeName = '/auth_sign_in';

  static Route<void> route(AuthSignInPageArgs args) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AuthSignInPage(args),
    );
  }

  @override
  ConsumerState<AuthSignInPage> createState() => _AuthSignInPageState();
}

class _AuthSignInPageState extends ConsumerState<AuthSignInPage> {
  late final _emailTextController =
      TextEditingController(text: widget.args.email);
  late final _passwordTextController =
      TextEditingController(text: widget.args.password);

  var _obscurePassword = true;

  Future<void> _onPressed() async {
    try {
      await ref.read(signInProvider)(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      if (mounted) {
        unawaited(Navigator.of(context).pushAndRemoveAll(MainPage.route()));
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
                        autofillHints: const [AutofillHints.password],
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
                        child: const Text('ログイン'),
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).replace(
                            oldRoute: ModalRoute.of(context)!,
                            newRoute: AuthSignUpPage.route(
                              AuthSignUpPageArgs(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              ),
                            ),
                          );
                        },
                        child: const Text('登録がお済みでない方'),
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
