import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth_app_user_repository.dart';
import '../current_app_user/current_app_user_notifier.dart';

final signInProvider = Provider.autoDispose(SignIn.new);

class SignIn {
  const SignIn(this._ref);
  final Ref _ref;

  Future<void> call({
    required String email,
    required String password,
  }) async {
    final auth = await _ref
        .read(authAppUserRepositoryProvider)
        .signInWithEmailAndPassword(email: email, password: password);
        
    if (auth.user != null) {
      _ref
          .read(currentAppUserNotifierProvider.notifier)
          .setUserId(userId: auth.user!.id);
    }
  }
}
