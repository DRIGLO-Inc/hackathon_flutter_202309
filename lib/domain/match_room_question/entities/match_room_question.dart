// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../question/entities/question.dart';

part 'match_room_question.freezed.dart';
part 'match_room_question.g.dart';

@freezed
class MatchRoomQuestion with _$MatchRoomQuestion {
  const factory MatchRoomQuestion({
    required String matchRoomQuestionId,
    required String matchRoomId,
    required Question question,
    @JsonKey(name: 'order_num')
    required int order,
  }) = _MatchRoomQuestion;

  const MatchRoomQuestion._();

  factory MatchRoomQuestion.fromJson(Map<String, Object?> json) =>
      _$MatchRoomQuestionFromJson(json);
}
