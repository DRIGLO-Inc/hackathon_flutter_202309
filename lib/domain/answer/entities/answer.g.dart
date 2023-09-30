// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      userId: json['user_id'] as String,
      isCorrect: json['is_correct'] as bool,
      durationTakenToAnswer: _$JsonConverterFromJson<int, Duration>(
          json['duration_taken_to_answer'],
          const SecondsDurationConverter().fromJson),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'user_id': instance.userId,
      'is_correct': instance.isCorrect,
      'duration_taken_to_answer': _$JsonConverterToJson<int, Duration>(
          instance.durationTakenToAnswer,
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
