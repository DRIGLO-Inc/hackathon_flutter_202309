// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_room_question.freezed.dart';
part 'match_room_question.g.dart';

@freezed
class MatchRoomQuestion with _$MatchRoomQuestion {
  const factory MatchRoomQuestion({
    required String roomId,
    required String questionId,
  }) = _MatchRoomQuestion;

  const MatchRoomQuestion._();

  factory MatchRoomQuestion.fromJson(Map<String, Object?> json) =>
      _$MatchRoomQuestionFromJson(json);
}
