import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

final authAppUserRepositoryProvider = riverpod.Provider.autoDispose(
  (_) => AuthAppUserRepository(Supabase.instance),
);

class AuthAppUserRepository {
  const AuthAppUserRepository(this._supabase);
  final Supabase _supabase;

  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  User? getCurrentUser() => _supabase.client.auth.currentUser;
}
