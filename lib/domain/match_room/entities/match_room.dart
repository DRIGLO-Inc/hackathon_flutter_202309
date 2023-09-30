// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_room.freezed.dart';
part 'match_room.g.dart';

@freezed
class MatchRoom with _$MatchRoom {
  const factory MatchRoom({
    required String matchRoomId,
    required String ownerId,
    required String invitationId,
    required bool isStart,
  }) = _MatchRoom;

  const MatchRoom._();
  factory MatchRoom.fromJson(Map<String, Object?> json) =>
      _$MatchRoomFromJson(json);
}
