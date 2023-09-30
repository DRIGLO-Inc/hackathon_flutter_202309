// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../match_room_question/entities/match_room_question.dart';
import '../../user_answer/entities/user_answer.dart';

part 'match_room_chat.freezed.dart';

@freezed
class MatchRoomChat with _$MatchRoomChat {
  const factory MatchRoomChat({
    required MatchRoomQuestion matchRoomQuestion,
    @Default([]) List<UserAnswer> userAnswerList,
  }) = _MatchRoomChat;

  const MatchRoomChat._();
}
