import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/sign_in/sign_in.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/extensions/navigator_state_ex.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/color/custom_colors.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/buttons/rounded_button.dart';
import '../../widgets/forms/rounded_rectangle_text_from.dart';
import '../../widgets/snack_bars/floating_snack_bar.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import '../main/main_page.dart';

class AuthSignInPageArgs extends Equatable {
  const AuthSignInPageArgs({required this.email, required this.password});

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [email, password];
}

class AuthSignInPage extends ConsumerStatefulWidget {
  const AuthSignInPage._(this.args);

  final AuthSignInPageArgs args;

  static const routeName = '/auth_sign_in';

  static Route<void> route(AuthSignInPageArgs args) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AuthSignInPage._(args),
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
        appBar: AppBar(
          title: Text(
            'ログイン',
            style: customTextTheme.body5.w6.copyWith(
              color: CustomColors.grayShade1000,
            ),
          ),
          backgroundColor: CustomColors.grayShade0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'テストの時間へようこそ',
                          style: customTextTheme.body2.w6,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 176,
                          width: 200,
                          child: Assets.images.png.signInImage.image(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'おかえりなさい',
                          style: customTextTheme.body2.w6,
                        ),
                        const SizedBox(height: 24),
                        RoundedRectangleTextForm(
                          controller: _emailTextController,
                          hintText: 'メールアドレスを入力',
                        ),
                        const SizedBox(height: 16),
                        RoundedRectangleTextForm(
                          controller: _passwordTextController,
                          hintText: 'パスワードを入力',
                          showObscureTextIcon: true,
                        ),
                        const SizedBox(height: 24),
                        RoundedButton(
                          height: 48,
                          width: constraints.maxWidth,
                          onTap: _onPressed,
                          child: const Text('ログインする'),
                        ),
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'パスワードを忘れた方はこちら',
                            style: customTextTheme.caption1.w6
                                .copyWith(color: CustomColors.grayShade1000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
