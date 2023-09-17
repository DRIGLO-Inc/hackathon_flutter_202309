import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';

final authAppUserRepositoryProvider = riverpod.Provider.autoDispose(
  (_) => AuthAppUserRepository(SupabaseConfig.instance),
);

class AuthAppUserRepository {
  const AuthAppUserRepository(this._supabase);
  final SupabaseConfig _supabase;

  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _supabase.run(
      (client) => client.auth.signInWithPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return _supabase.run(
      (client) => client.auth.signUp(
        email: email,
        password: password,
        // TODO(tsuda): カスタムスキームに遷移
        // emailRedirectTo: '',
      ),
    );
  }

  Future<void> signOut() async {
    return _supabase.run(
      (client) => client.auth.signOut(),
    );
  }

  User? getCurrentUser() => _supabase.runSync(
        (client) => client.auth.currentUser,
      );
}
