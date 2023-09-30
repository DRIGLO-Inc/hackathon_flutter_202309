// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      userId: json['userId'] as String,
      isCorrect: json['isCorrect'] as bool,
      durationTakenToAnswer: _$JsonConverterFromJson<int, Duration>(
          json['durationTakenToAnswer'],
          const SecondsDurationConverter().fromJson),
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'userId': instance.userId,
      'isCorrect': instance.isCorrect,
      'durationTakenToAnswer': _$JsonConverterToJson<int, Duration>(
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
