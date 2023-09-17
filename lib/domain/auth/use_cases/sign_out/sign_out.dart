import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth_app_user_repository.dart';
import '../current_app_user/current_app_user_notifier.dart';

final signOutProvider = Provider.autoDispose(SignOut.new);

class SignOut {
  const SignOut(this._ref);
  final Ref _ref;

  Future<void> call() async {
    await _ref.read(authAppUserRepositoryProvider).signOut();
    _ref.read(currentAppUserNotifierProvider.notifier).remove();
  }
}
