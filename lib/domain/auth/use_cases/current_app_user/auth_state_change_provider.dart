import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth_app_user_repository.dart';

final authStateChangeProvider = StreamProvider(
  (ref) => ref.read(authAppUserRepositoryProvider).onAuthStateChange,
);
