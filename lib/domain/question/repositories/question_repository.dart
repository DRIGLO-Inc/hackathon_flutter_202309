import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../entities/question.dart';

final questionRepository = riverpod.Provider.autoDispose(
  (_) => QuestionRepository(SupabaseConfig.instance),
);

class QuestionRepository {
  const QuestionRepository(this._supabase);
  final SupabaseConfig _supabase;

  FutureOr<List<Question>> fetchList({required String userId}) {
    return _supabase.run(
      (client) async {
        return await client.rpc('get_random_questions').withConverter(
              (rows) => [
                for (final row
                    in List<PostgrestMap>.from(rows as List<dynamic>))
                  Question.fromJson(row),
              ],
            );
      },
    );
  }
}
