import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/match_room_question.dart';

final matchRoomQuestionRepository = riverpod.Provider.autoDispose(
  (_) => MatchRoomQuestionRepository(SupabaseConfig.instance),
);

class MatchRoomQuestionRepository {
  const MatchRoomQuestionRepository(this._supabase);
  final SupabaseConfig _supabase;

  FutureOr<List<MatchRoomQuestion>> fetchList({required String matchRoomId}) {
    return _supabase.run(
      (client) => client
          .from(SupabaseTables.matchRoomQuestions)
          .select<PostgrestList>('*,question:questions(*,genre:genres(*))')
          .eq('match_room_id', matchRoomId)
          .withConverter(
            (rows) => [
              for (final row in rows) MatchRoomQuestion.fromJson(row),
            ],
          ),
    );
  }

  FutureOr<void> save({required List<MatchRoomQuestion> matchRoomQuestions}) {
    return _supabase.run(
      (client) async {
        await client //
            .from(SupabaseTables.matchRoomQuestions)
            .insert(
              matchRoomQuestions.map((e) {
                final json = e.toJson();
                // ignore: cascade_invocations
                json.remove('question');

                return {...json, 'question_id': e.question.questionId};
              }).toList(),
            );
      },
    );
  }
}
