// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchRoom _$$_MatchRoomFromJson(Map<String, dynamic> json) => _$_MatchRoom(
      roomId: json['room_id'] as String,
      invitationId: json['invitation_id'] as String,
      isStart: json['is_start'] as bool,
    );

Map<String, dynamic> _$$_MatchRoomToJson(_$_MatchRoom instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'invitation_id': instance.invitationId,
      'is_start': instance.isStart,
    };
