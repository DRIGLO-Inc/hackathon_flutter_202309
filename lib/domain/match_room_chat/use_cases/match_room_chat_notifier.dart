import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../genre/entities/genre.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../question/entities/question.dart';
import '../../user_answer/entities/user_answer.dart';
import '../../user_data/entities/user_data.dart';
import '../entities/match_room_chat.dart';
import 'match_room_chat_answered_questions.dart';
import 'match_room_chat_count.dart';

final matchRoomChatListNotifierProvider = AsyncNotifierProvider.autoDispose<
    MatchRoomChatListNotifier, List<MatchRoomChat>>(
  MatchRoomChatListNotifier.new,
);

class MatchRoomChatListNotifier
    extends AutoDisposeAsyncNotifier<List<MatchRoomChat>> {
  List<MatchRoomChat> _fetchedList = [];

  @override
  FutureOr<List<MatchRoomChat>> build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    _listenTimer();

    // TODO(tsuda): 取得したものをまとめる
    _fetchedList = [
      for (var i = 1; i < 5; i++)
        MatchRoomChat(
          matchRoomQuestion: MatchRoomQuestion(
            matchRoomQuestionId: 'matchRoomQuestionId$i',
            roomId: 'roomId$i',
            question: Question(
              questionId: 'questionId$i',
              title: 'title$i',
              answer: 'answer$i',
              genre: const Genre(genreId: 'genreId', genreName: 'genreName'),
            ),
            order: i,
          ),
        ),
    ];

    if (_fetchedList.isEmpty) {
      return [];
    }

    _listenUserAnswer(
      matchRoomQuestion: _fetchedList.first.matchRoomQuestion,
    );
    return [_fetchedList.first];
  }

  void setOwnUserAnswer(String answer) {
    _setUserAnswer(
      UserAnswer(
        userAnswerId: 'userAnswerId',
        matchRoomQuestion: state.asData!.value.last.matchRoomQuestion,
        answer: answer,
        user: UserData(
          userId: ref.read(currentAppUserNotifierProvider).getUserId(),
          userName: 'あなた',
        ),
        isCorrect: Random().nextBool(),
      ),
    );
  }

  void _setUserAnswer(UserAnswer data) {
    state = state.whenData(
      (value) => [
        for (final e in value)
          if (e.matchRoomQuestion.matchRoomQuestionId ==
              data.matchRoomQuestion.matchRoomQuestionId)
            e.copyWith(userAnswerList: [...e.userAnswerList, data])
          else
            e,
      ],
    );
  }

  Timer? _timer;

  void _listenTimer() {
    ref.read(matchRoomCountProvider.notifier).state = 0;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(matchRoomCountProvider.notifier).state = timer.tick;

      if (timer.tick == MatchRoomChatCount.maxCount) {
        timer.cancel();
        _setNextQuestionIfExist();
      }
    });
  }

  StreamSubscription<UserAnswer>? _streamSubscription;

  // TODO(tsuda): ユーザーのアンサーを監視
  void _listenUserAnswer({required MatchRoomQuestion matchRoomQuestion}) {
    _streamSubscription?.cancel();

    _streamSubscription = Stream.fromFuture(
      Future.delayed(
        const Duration(seconds: 1),
        () => UserAnswer(
          userAnswerId: 'userAnswerId',
          matchRoomQuestion: matchRoomQuestion,
          answer: 'answer',
          user: UserData(
            userId: '',
            userName:
                '太郎${matchRoomQuestion.matchRoomQuestionId.split('').last}',
          ),
          isCorrect: Random().nextBool(),
        ),
      ),
    ).listen(_setUserAnswer);
  }

  void _setNextQuestionIfExist() {
    final currentQuestion = state.asData!.value.last.matchRoomQuestion;
    final index = _fetchedList.indexWhere(
      (element) =>
          element.matchRoomQuestion.question.questionId ==
          currentQuestion.question.questionId,
    );

    ref
        .read(matchRoomAnsweredQuestionIdsProvider.notifier)
        .update((state) => [...state, currentQuestion.matchRoomQuestionId]);
    final next = _fetchedList.elementAtOrNull(index + 1);

    _streamSubscription?.cancel();

    if (next != null) {
      _listenUserAnswer(
        matchRoomQuestion: next.matchRoomQuestion,
      );
      state = AsyncData([
        ...state.asData!.value,
        next,
      ]);

      _listenTimer();
    } else {}
  }
}
