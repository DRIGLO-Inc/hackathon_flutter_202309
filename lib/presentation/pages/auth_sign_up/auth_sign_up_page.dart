import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../../domain/auth/use_cases/sign_up/sign_up.dart';
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

  Future<void> _onPressed() async {
    try {
      await ref.read(signUpProvider)(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      if (mounted && ref.read(currentAppUserNotifierProvider).isAuthenticated) {
        unawaited(Navigator.of(context).pushAndRemoveAll(MainPage.route()));
      }
    } on Exception catch (_) {
      if (mounted) {
        // TODO(tsuda): エラーの種類によって、メッセージを出し分ける
        FloatingSnackBar.showError(context, message: '新規登録に失敗しました');
      }
    }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusGestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '新規登録',
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
                          child: Assets.images.png.mainImage.image(),
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
                        Text.rich(
                          TextSpan(
                            text: '新規登録またはログインすることで',
                            children: [
                              TextSpan(
                                text: '利用規約',
                                style: customTextTheme.caption1
                                    .copyWith(color: CustomColors.accentBlue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                mouseCursor: SystemMouseCursors.precise,
                              ),
                              TextSpan(
                                text: 'に同意いただいたものとします。',
                                style: customTextTheme.caption1,
                              ),
                            ],
                          ),
                          style: customTextTheme.caption1,
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                        ),
                        const SizedBox(height: 24),
                        RoundedButton(
                          height: 48,
                          width: constraints.maxWidth,
                          onTap: _onPressed,
                          child: const Text('新規登録する'),
                        ),
                        const SizedBox(height: 24),
                        Text.rich(
                          TextSpan(
                            text: 'すでに登録済みの方は',
                            children: [
                              TextSpan(
                                text: 'ログイン',
                                style: customTextTheme.caption1.w6
                                    .copyWith(color: CustomColors.accentBlue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = Navigator.of(context).pop,
                                mouseCursor: SystemMouseCursors.precise,
                              ),
                              TextSpan(
                                text: 'する',
                                style: customTextTheme.caption1.w6,
                              ),
                            ],
                          ),
                          style: customTextTheme.caption1.w6,
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
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
