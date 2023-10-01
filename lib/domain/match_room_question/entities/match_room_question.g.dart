// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_room_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchRoomQuestion _$$_MatchRoomQuestionFromJson(Map<String, dynamic> json) =>
    _$_MatchRoomQuestion(
      matchRoomQuestionId: json['match_room_question_id'] as String,
      roomId: json['room_id'] as String,
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
      order: json['order_num'] as int,
    );

Map<String, dynamic> _$$_MatchRoomQuestionToJson(
        _$_MatchRoomQuestion instance) =>
    <String, dynamic>{
      'match_room_question_id': instance.matchRoomQuestionId,
      'room_id': instance.roomId,
      'question': instance.question,
      'order_num': instance.order,
    };
