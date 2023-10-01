import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/logger.dart';
import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../match_room_question/entities/match_room_question.dart';
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

    final isCorrect = matchRoomQuestion.question.answer == text ||
        matchRoomQuestion.question.answerTexts.contains(text);

    logger.info('isCorrect: $isCorrect');

    await _ref.read(userAnswerRepository).save(
          title: matchRoomQuestion.question.title,
          isCorrect: isCorrect,
          userId: userId,
          answer: matchRoomQuestion.question.answer,
          userAnswer: text,
          matchRoomQuestionId: matchRoomQuestion.matchRoomQuestionId,
        );
  }
}
