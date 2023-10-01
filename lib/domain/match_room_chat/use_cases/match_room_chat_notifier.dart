import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../match_room/use_cases/match_room_watch_is_start.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../match_room_question/repositories/match_room_question_repository.dart';
import '../../user_answer/entities/user_answer.dart';
import '../../user_answer/repositories/user_answer_repository.dart';
import '../entities/match_room_chat.dart';
import 'match_room_chat_answered_questions.dart';
import 'match_room_chat_count.dart';

final matchRoomChatListNotifierProvider = AsyncNotifierProvider.autoDispose
    .family<MatchRoomChatListNotifier, List<MatchRoomChat>, String>(
  MatchRoomChatListNotifier.new,
);

class MatchRoomChatListNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<MatchRoomChat>, String> {
  List<MatchRoomChat> _fetchedList = [];

  @override
  FutureOr<List<MatchRoomChat>> build(String arg) async {
    ref
      ..watch(matchRoomIsStartProvider(arg))
      ..onDispose(() {
        _timer?.cancel();
      });

    _listenTimer();

    final questions =
        await ref.read(matchRoomQuestionRepository).fetchList(matchRoomId: arg);

    _fetchedList = questions
        .map((e) => MatchRoomChat(matchRoomQuestion: e, userAnswerList: []))
        .toList();
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
        userAnswerId: const Uuid().v4(),
        userAnswer: answer,
        matchRoomQuestionId:
            state.asData!.value.last.matchRoomQuestion.matchRoomQuestionId,
        answer: state.asData!.value.last.matchRoomQuestion.question.answer,
        userId: ref.read(currentAppUserNotifierProvider).getUserId(),
        isCorrect: Random().nextBool(),
      ),
    );
  }

  void _setUserAnswer(UserAnswer data) {
    state = state.whenData(
      (value) => [
        for (final e in value)
          if (e.matchRoomQuestion.matchRoomQuestionId ==
              data.matchRoomQuestionId)
            e.copyWith(
              userAnswerList: [
                ...e.userAnswerList,
                data,
              ].fold([], (previousValue, cur) {
                if (previousValue.any((e) => e.userId == cur.userId)) {
                  return previousValue;
                } else {
                  return [...previousValue, cur];
                }
              }),
            )
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

  StreamSubscription<List<UserAnswer>>? _streamSubscription;

  void _listenUserAnswer({required MatchRoomQuestion matchRoomQuestion}) {
    _streamSubscription?.cancel();

    _streamSubscription = ref
        .read(userAnswerRepository)
        .watch(matchRoomQuestionId: matchRoomQuestion.matchRoomQuestionId)
        .listen((event) {
      for (final userAnswer in event) {
        _setUserAnswer(userAnswer);
      }
    });
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
