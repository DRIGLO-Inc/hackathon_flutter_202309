import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/user_data.dart';

final userDataRepository = riverpod.Provider.autoDispose(
  (_) => UserDataRepository(SupabaseConfig.instance),
);

class UserDataRepository {
  const UserDataRepository(this._supabase);
  final SupabaseConfig _supabase;

  FutureOr<UserData> fetch({required String userId}) {
    return _supabase.run<UserData>(
      (client) async {
        return await client
            .from(SupabaseTables.users)
            .select<PostgrestMap?>()
            .eq('user_id', userId)
            .maybeSingle()
            .withConverter((row) {
          if (row == null) {
            throw Exception('user not found');
          }
          return UserData.fromJson(row);
        });
      },
    );
  }
}
