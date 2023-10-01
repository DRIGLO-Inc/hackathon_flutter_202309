import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../entities/user_answer.dart';
import '../repositories/user_answer_repository.dart';

final userAnswerSaveProvider = Provider.autoDispose(UserAnswerSave.new);

class UserAnswerSave {
  const UserAnswerSave(this._ref);
  final Ref _ref;

  Future<void> call(
    String text, {
    required MatchRoomQuestion matchRoomQuestion,
  }) async {
    final userId = _ref.read(currentAppUserNotifierProvider).getUserId();

    await _ref.read(userAnswerRepository).save(
          isCorrect: matchRoomQuestion.question.answerTexts.contains(text),
          userId: userId,
          answer: matchRoomQuestion.question.answer,
          userAnswer: text,
          matchRoomQuestionId: matchRoomQuestion.matchRoomQuestionId,
        );
  }
}
