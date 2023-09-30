// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../genre/entities/genre.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String questionId,
    required String title,
    required String answer,
    @Default([]) List<String> answerTexts,
    required Genre genre,
  }) = _Question;

  const Question._();
  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);

  
}
