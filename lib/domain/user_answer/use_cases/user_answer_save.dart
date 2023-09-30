import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';

final userAnswerSaveProvider = Provider.autoDispose(UserAnswerSave.new);

class UserAnswerSave {
  const UserAnswerSave(this._ref);
  final Ref _ref;

  Future<void> call(String text) async {
    final userId = _ref.read(currentAppUserNotifierProvider).getUserId();
    // TODO(tsuda): UserAnswer の 保存機能
  }
}
