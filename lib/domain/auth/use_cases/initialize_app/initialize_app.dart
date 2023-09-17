import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth_app_user_repository.dart';
import 'initialize_app_status.dart';

final initializeAppProvider = FutureProvider((ref) async {
  final user = await ref.read(authAppUserRepositoryProvider).getUser();

  if (user == null) {
    return InitializeAppStatus.noAuth;
  } else {
    return InitializeAppStatus.completed;
  }
});
