// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converters/json_converters.dart';
import '../../match_room_question/entities/match_room_question.dart';
import '../../user_data/entities/user_data.dart';

part 'user_answer.freezed.dart';
part 'user_answer.g.dart';

@freezed
class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required String userAnswerId,
    required MatchRoomQuestion matchRoomQuestion,
    required String answer,
    required UserData user,
    required bool isCorrect,
    @SecondsDurationConverter() Duration? durationTakenToUserAnswer,
  }) = _UserAnswer;

  const UserAnswer._();
  factory UserAnswer.fromJson(Map<String, Object?> json) =>
      _$UserAnswerFromJson(json);
}
