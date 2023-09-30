import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../genre/entities/genre.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../question/entities/question.dart';
import '../../user_answer/entities/user_answer.dart';
import '../../user_data/user_data.dart';
import '../entities/match_room_chat.dart';
import 'match_room_chat_count.dart';
import 'match_room_chat_current_question_id.dart';

final matchRoomChatListNotifier = AsyncNotifierProvider.autoDispose<
    MatchRoomChatListNotifier, List<MatchRoomChat>>(
  MatchRoomChatListNotifier.new,
);

class MatchRoomChatListNotifier
    extends AutoDisposeAsyncNotifier<List<MatchRoomChat>> {
  @override
  FutureOr<List<MatchRoomChat>> build() {
    _listenTimer();

    // TODO(tsuda): 取得したものをまとめる
    return [
      MatchRoomChat(
        matchRoomQuestion: const MatchRoomQuestion(
          matchRoomQuestionId: 'matchRoomQuestionId',
          roomId: 'roomId',
          question: Question(
            questionId: 'questionId',
            title: 'title',
            answer: 'answer',
            genre: Genre(genreId: 'genreId', genreName: 'genreName'),
          ),
          order: 1,
        ),
        userAnswerList: [
          UserAnswer(
            userAnswerId: 'userAnswerId',
            matchRoomQuestion: const MatchRoomQuestion(
              matchRoomQuestionId: 'matchRoomQuestionId',
              roomId: 'roomId',
              question: Question(
                questionId: 'questionId',
                title: 'title',
                answer: 'answer',
                genre: Genre(genreId: 'genreId', genreName: 'genreName'),
              ),
              order: 1,
            ),
            answer: 'answer' * 5,
            user: const UserData(userId: 'userId', userName: 'userName'),
            isCorrect: true,
          ),
        ],
      ),
    ];
  }

  ProviderSubscription<AsyncValue<int>>? _countTimerSub;

  void _listenTimer() {
    _countTimerSub = ref.listen<AsyncValue<int>>(
      matchRoomCountProvider,
      (_, next) {
        if (next.valueOrNull == 15) {
          final currentQuestionId = ref.read(
            matchRoomChatCurrentQuestionIdProvider,
          );

          final currentValue = state.valueOrNull;

          if (currentValue == null) {
            _countTimerSub?.close();
            _countTimerSub = null;
            return;
          }

          if (currentQuestionId == null) {
            ref
                    .read(
                      matchRoomChatCurrentQuestionIdProvider.notifier,
                    )
                    .state =
                currentValue.first.matchRoomQuestion.question.questionId;
          } else {
            final index = currentValue.indexWhere(
              (element) =>
                  element.matchRoomQuestion.question.questionId ==
                  currentQuestionId,
            );

            final nextQuestionId = currentValue
                .elementAtOrNull(index + 1)
                ?.matchRoomQuestion
                .question
                .questionId;

            if (index.isNegative || nextQuestionId == null) {
              _countTimerSub?.close();
              _countTimerSub = null;
            } else {
              ref
                  .read(
                    matchRoomChatCurrentQuestionIdProvider.notifier,
                  )
                  .state = nextQuestionId;
            }
          }
        }
      },
    );
  }
}
