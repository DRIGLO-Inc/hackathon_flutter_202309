// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converters/json_converters.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String userId,
    required bool isCorrect,
    @SecondsDurationConverter()
    Duration? durationTakenToAnswer,
  }) = _Answer;

  const Answer._();
  factory Answer.fromJson(Map<String, Object?> json) => _$AnswerFromJson(json);

}
