import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logger.dart';
import '../../repositories/auth_app_user_repository.dart';
import '../current_app_user/current_app_user_notifier.dart';
import 'initialize_app_status.dart';

final initializeAppProvider = FutureProvider((ref) async {
  try {
    final response = await ref.read(authAppUserRepositoryProvider).getUser();

    logger.info('User: ${response.user?.id}');

    if (response.user?.id case final userId?) {
      ref
          .read(currentAppUserNotifierProvider.notifier)
          .setUserId(userId: userId);
    }

    if (response.user == null) {
      return InitializeAppStatus.noAuth;
    } else {
      return InitializeAppStatus.completed;
    }
  } on Exception catch (_) {
    return InitializeAppStatus.noAuth;
  }
});
