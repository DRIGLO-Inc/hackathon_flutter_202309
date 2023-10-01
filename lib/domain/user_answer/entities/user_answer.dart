// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converters/json_converters.dart';

part 'user_answer.freezed.dart';
part 'user_answer.g.dart';

@freezed
class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required String userAnswerId,
    required String matchRoomQuestionId,
    required String userAnswer,
    required String answer,
    required String userId,
    required bool isCorrect,
    @SecondsDurationConverter() Duration? durationTakenToUserAnswer,
  }) = _UserAnswer;

  const UserAnswer._();
  factory UserAnswer.fromJson(Map<String, Object?> json) =>
      _$UserAnswerFromJson(json);
}
