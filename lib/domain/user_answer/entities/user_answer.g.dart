// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAnswer _$$_UserAnswerFromJson(Map<String, dynamic> json) =>
    _$_UserAnswer(
      userAnswerId: json['user_answer_id'] as String,
      matchRoomQuestion: MatchRoomQuestion.fromJson(
          json['match_room_question'] as Map<String, dynamic>),
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      isCorrect: json['is_correct'] as bool,
      durationTakenToUserAnswer: _$JsonConverterFromJson<int, Duration>(
          json['duration_taken_to_user_answer'],
          const SecondsDurationConverter().fromJson),
    );

Map<String, dynamic> _$$_UserAnswerToJson(_$_UserAnswer instance) =>
    <String, dynamic>{
      'user_answer_id': instance.userAnswerId,
      'match_room_question': instance.matchRoomQuestion,
      'user': instance.user,
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
