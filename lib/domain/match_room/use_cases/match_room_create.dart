import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../match_room_question/repositories/match_room_question_repository.dart';
import '../../question/repositories/question_repository.dart';
import '../entities/match_room.dart';
import '../repositories/match_room_repository.dart';

final matchRoomCreateProvider = Provider.autoDispose(MatchRoomCreate.new);

class MatchRoomCreate {
  const MatchRoomCreate(this._ref);
  final Ref _ref;

  Future<MatchRoom> call() async {
    final matchRoom = await _ref.read(matchRoomRepository).create(
          MatchRoom(
            matchRoomId: const Uuid().v4(),
            ownerId: _ref.read(currentAppUserNotifierProvider).getUserId(),
            invitationId: const Uuid().v1().split('-')[0],
            isStart: false,
          ),
        );

    final questions =
        await _ref.read(questionRepository).fetchRandomQuestions();

    if (questions.isEmpty) {
      throw Exception('問題が存在しません');
    }

    await _ref.read(matchRoomQuestionRepository).save(
      matchRoomQuestions: [
        for (final (i, question) in questions.indexed)
          MatchRoomQuestion(
            matchRoomQuestionId: const Uuid().v4(),
            matchRoomId: matchRoom.matchRoomId,
            question: question,
            order: i + 1,
          ),
      ],
    );

    return matchRoom;
  }
}
