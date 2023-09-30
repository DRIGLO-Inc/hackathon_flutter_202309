import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../genre/entities/genre.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../question/entities/question.dart';
import '../../user_answer/entities/user_answer.dart';
import '../../user_data/user_data.dart';
import '../entities/match_room_chat.dart';

final matchRoomChatListNotifier = AsyncNotifierProvider.autoDispose<
    MatchRoomChatListNotifier, List<MatchRoomChat>>(
  MatchRoomChatListNotifier.new,
);

class MatchRoomChatListNotifier
    extends AutoDisposeAsyncNotifier<List<MatchRoomChat>> {
  @override
  FutureOr<List<MatchRoomChat>> build() {
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
          order: 2,
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
              order: 2,
            ),
            answer: 'answer' * 5,
            user: const UserData(userId: 'userId', userName: 'userName'),
            isCorrect: true,
          ),
        ],
      ),
    ];
  }
}
