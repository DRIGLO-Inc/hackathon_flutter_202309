import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/user_answer.dart';

final userAnswerRepository =
    Provider.autoDispose((_) => UserAnswerRepository(SupabaseConfig.instance));

class UserAnswerRepository {
  UserAnswerRepository(this._supabaseConfig);

  final SupabaseConfig _supabaseConfig;

  Stream<List<UserAnswer>> watch({required String matchRoomQuestionId}) =>
      _supabaseConfig.runSync(
        (client) => client
            .from(SupabaseTables.userAnswers)
            .stream(primaryKey: ['user_answer_id'])
            .eq('match_room_question_id', matchRoomQuestionId)
            .asyncMap(
              (event) {
                return event.map(UserAnswer.fromJson).toList();
              },
            ),
      );

  Future<void> save({
    required String userId,
    required String answer,
    required String title,
    required String userAnswer,
    required String matchRoomQuestionId,
    required bool isCorrect,
  }) async =>
      _supabaseConfig.runSync(
        (client) => client.from(SupabaseTables.userAnswers).insert({
          'user_answer_id': const Uuid().v4(),
          'match_room_question_id': matchRoomQuestionId,
          'user_id': userId,
          'title': title,
          'answer': answer,
          'user_answer': userAnswer,
          'duration_taken_to_answer': 20,
          'is_correct': isCorrect,
          'answered_at': DateTime.now().toUtc().toIso8601String(),
        }),
      );
}
