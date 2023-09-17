import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth_app_user_repository.dart';
import '../current_app_user/current_app_user_notifier.dart';

final signUpProvider = Provider.autoDispose(SignUp.new);

class SignUp {
  const SignUp(this._ref);
  final Ref _ref;

  Future<void> call({
    required String email,
    required String password,
  }) async {
    final auth = await _ref
        .read(authAppUserRepositoryProvider)
        .signUp(email: email, password: password);

    if (auth.user != null) {
      _ref
          .read(currentAppUserNotifierProvider.notifier)
          .setUserId(userId: auth.user!.id);
    }
  }
}
