import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/logger.dart';
import '../../entities/current_app_user/current_app_user.dart';
import 'auth_state_change_provider.dart';

final currentAppUserNotifierProvider =
    NotifierProvider.autoDispose<CurrentAppUserNotifier, CurrentAppUser>(
  CurrentAppUserNotifier.new,
);

class CurrentAppUserNotifier extends AutoDisposeNotifier<CurrentAppUser> {
  @override
  CurrentAppUser build() {
    final user = ref.watch(authStateChangeProvider).valueOrNull?.session?.user;

    logger.info('Supabase User: ${user?.id}');

    if (user == null) {
      return CurrentAppUser.none();
    } else {
      return CurrentAppUser.authenticated(userId: user.id);
    }
  }

  void setUserId({required String userId}) {
    state = CurrentAppUserAuthenticated(userId: userId);
  }

  void remove() {
    state = CurrentAppUser.none();
  }
}
