import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../../../utils/logger.dart';
import '../../genre/entities/genre.dart';
import '../entities/question.dart';

final questionRepository = riverpod.Provider.autoDispose(
  (_) => QuestionRepository(SupabaseConfig.instance),
);

class QuestionRepository {
  const QuestionRepository(this._supabase);
  final SupabaseConfig _supabase;

  FutureOr<List<Question>> fetchRandomQuestions() {
    return _supabase.run(
      (client) async {
        return client
            .from(SupabaseTables.questions)
            .select<PostgrestList>('*,genre:genres(*)')
            .limit(1)
            .withConverter(
              (rows) => [for (final row in rows) Question.fromJson(row)],
            );
      },
    );
  }

  FutureOr<List<Question>> fetchList({required String matchRoomId}) {
    return _supabase.run(
      (client) => client //
          .from(SupabaseTables.questions)
          .select<PostgrestList>('*,genre:genres(*)')
          .eq('match_room_id', matchRoomId)
          .withConverter(
        (rows) {
          return [for (final row in rows) Question.fromJson(row)];
        },
      ),
    );
  }

  Future<int> questionCount({required Genre genre}) async {
    return _supabase.run((client) {
      final data = client
          .from(SupabaseTables.questions)
          .select<PostgrestListResponse>(
            'question_id',
            const FetchOptions(
              count: CountOption.exact,
            ),
          )
          .eq('genre_id', genre.genreId);

      return data.then((value) {
        logger
          ..info('value: $value')
          ..info('value.length: ${value.count}}');
        return value.count ?? 10;
      });
    });
  }

  FutureOr<void> save({required List<Question> questions}) {
    return _supabase.run(
      (client) => client //
          .from(SupabaseTables.questions)
          .insert(questions.map((e) => e.toJson()).toList()),
    );
  }
}
