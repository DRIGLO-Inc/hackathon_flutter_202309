import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/question.dart';

final questionRepository = riverpod.Provider.autoDispose(
  (_) => QuestionRepository(SupabaseConfig.instance),
);

class QuestionRepository {
  const QuestionRepository(this._supabase);
  final SupabaseConfig _supabase;

  FutureOr<List<String>> fetchRandomIds() {
    return _supabase.run(
      (client) async {
        final temp = await client.rpc('get_random_questions');
        // TODO: 結果の形式を確認後、調整して返す
        print(temp);
        return [];
      },
    );
  }

  FutureOr<List<Question>> fetchList({required String matchRoomId}) {
    return _supabase.run(
      (client) => client //
          .from(SupabaseTables.questions)
          .select<PostgrestList>()
          .eq('match_room_id', matchRoomId)
          .withConverter(
            (rows) => [for (final row in rows) Question.fromJson(row)],
          ),
    );
  }

  FutureOr<void> save({required List<Question> questions}) {
    return _supabase.run(
      (client) => client //
          .from(SupabaseTables.questions)
          .insert(questions.map((e) => e.toJson()).toList()),
    );
  }
}
