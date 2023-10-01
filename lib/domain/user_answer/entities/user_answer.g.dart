// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAnswer _$$_UserAnswerFromJson(Map<String, dynamic> json) =>
    _$_UserAnswer(
      userAnswerId: json['user_answer_id'] as String,
      matchRoomQuestionId: json['match_room_question_id'] as String,
      userAnswer: json['user_answer'] as String,
      answer: json['answer'] as String,
      userId: json['user_id'] as String,
      isCorrect: json['is_correct'] as bool,
      durationTakenToUserAnswer: _$JsonConverterFromJson<int, Duration>(
          json['duration_taken_to_user_answer'],
          const SecondsDurationConverter().fromJson),
    );

Map<String, dynamic> _$$_UserAnswerToJson(_$_UserAnswer instance) =>
    <String, dynamic>{
      'user_answer_id': instance.userAnswerId,
      'match_room_question_id': instance.matchRoomQuestionId,
      'user_answer': instance.userAnswer,
      'answer': instance.answer,
      'user_id': instance.userId,
      'is_correct': instance.isCorrect,
      'duration_taken_to_user_answer': _$JsonConverterToJson<int, Duration>(
          instance.durationTakenToUserAnswer,
          const SecondsDurationConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
