// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchRoom _$MatchRoomFromJson(Map<String, dynamic> json) {
  return _MatchRoom.fromJson(json);
}

/// @nodoc
mixin _$MatchRoom {
  String get roomId => throw _privateConstructorUsedError;
  String get invitationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchRoomCopyWith<MatchRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRoomCopyWith<$Res> {
  factory $MatchRoomCopyWith(MatchRoom value, $Res Function(MatchRoom) then) =
      _$MatchRoomCopyWithImpl<$Res, MatchRoom>;
  @useResult
  $Res call({String roomId, String invitationId});
}

/// @nodoc
class _$MatchRoomCopyWithImpl<$Res, $Val extends MatchRoom>
    implements $MatchRoomCopyWith<$Res> {
  _$MatchRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? invitationId = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchRoomCopyWith<$Res> implements $MatchRoomCopyWith<$Res> {
  factory _$$_MatchRoomCopyWith(
          _$_MatchRoom value, $Res Function(_$_MatchRoom) then) =
      __$$_MatchRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, String invitationId});
}

/// @nodoc
class __$$_MatchRoomCopyWithImpl<$Res>
    extends _$MatchRoomCopyWithImpl<$Res, _$_MatchRoom>
    implements _$$_MatchRoomCopyWith<$Res> {
  __$$_MatchRoomCopyWithImpl(
      _$_MatchRoom _value, $Res Function(_$_MatchRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? invitationId = null,
  }) {
    return _then(_$_MatchRoom(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      invitationId: null == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchRoom extends _MatchRoom {
  const _$_MatchRoom({required this.roomId, required this.invitationId})
      : super._();

  factory _$_MatchRoom.fromJson(Map<String, dynamic> json) =>
      _$$_MatchRoomFromJson(json);

  @override
  final String roomId;
  @override
  final String invitationId;

  @override
  String toString() {
    return 'MatchRoom(roomId: $roomId, invitationId: $invitationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchRoom &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, invitationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchRoomCopyWith<_$_MatchRoom> get copyWith =>
      __$$_MatchRoomCopyWithImpl<_$_MatchRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchRoomToJson(
      this,
    );
  }
}

abstract class _MatchRoom extends MatchRoom {
  const factory _MatchRoom(
      {required final String roomId,
      required final String invitationId}) = _$_MatchRoom;
  const _MatchRoom._() : super._();

  factory _MatchRoom.fromJson(Map<String, dynamic> json) =
      _$_MatchRoom.fromJson;

  @override
  String get roomId;
  @override
  String get invitationId;
  @override
  @JsonKey(ignore: true)
  _$$_MatchRoomCopyWith<_$_MatchRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
