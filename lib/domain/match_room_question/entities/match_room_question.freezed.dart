// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_room_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchRoomQuestion _$MatchRoomQuestionFromJson(Map<String, dynamic> json) {
  return _MatchRoomQuestion.fromJson(json);
}

/// @nodoc
mixin _$MatchRoomQuestion {
  String get matchRoomQuestionId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  Question get question => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchRoomQuestionCopyWith<MatchRoomQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRoomQuestionCopyWith<$Res> {
  factory $MatchRoomQuestionCopyWith(
          MatchRoomQuestion value, $Res Function(MatchRoomQuestion) then) =
      _$MatchRoomQuestionCopyWithImpl<$Res, MatchRoomQuestion>;
  @useResult
  $Res call(
      {String matchRoomQuestionId,
      String roomId,
      Question question,
      int order});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$MatchRoomQuestionCopyWithImpl<$Res, $Val extends MatchRoomQuestion>
    implements $MatchRoomQuestionCopyWith<$Res> {
  _$MatchRoomQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchRoomQuestionId = null,
    Object? roomId = null,
    Object? question = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      matchRoomQuestionId: null == matchRoomQuestionId
          ? _value.matchRoomQuestionId
          : matchRoomQuestionId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MatchRoomQuestionCopyWith<$Res>
    implements $MatchRoomQuestionCopyWith<$Res> {
  factory _$$_MatchRoomQuestionCopyWith(_$_MatchRoomQuestion value,
          $Res Function(_$_MatchRoomQuestion) then) =
      __$$_MatchRoomQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String matchRoomQuestionId,
      String roomId,
      Question question,
      int order});

  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$_MatchRoomQuestionCopyWithImpl<$Res>
    extends _$MatchRoomQuestionCopyWithImpl<$Res, _$_MatchRoomQuestion>
    implements _$$_MatchRoomQuestionCopyWith<$Res> {
  __$$_MatchRoomQuestionCopyWithImpl(
      _$_MatchRoomQuestion _value, $Res Function(_$_MatchRoomQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchRoomQuestionId = null,
    Object? roomId = null,
    Object? question = null,
    Object? order = null,
  }) {
    return _then(_$_MatchRoomQuestion(
      matchRoomQuestionId: null == matchRoomQuestionId
          ? _value.matchRoomQuestionId
          : matchRoomQuestionId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchRoomQuestion extends _MatchRoomQuestion {
  const _$_MatchRoomQuestion(
      {required this.matchRoomQuestionId,
      required this.roomId,
      required this.question,
      required this.order})
      : super._();

  factory _$_MatchRoomQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_MatchRoomQuestionFromJson(json);

  @override
  final String matchRoomQuestionId;
  @override
  final String roomId;
  @override
  final Question question;
  @override
  final int order;

  @override
  String toString() {
    return 'MatchRoomQuestion(matchRoomQuestionId: $matchRoomQuestionId, roomId: $roomId, question: $question, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchRoomQuestion &&
            (identical(other.matchRoomQuestionId, matchRoomQuestionId) ||
                other.matchRoomQuestionId == matchRoomQuestionId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, matchRoomQuestionId, roomId, question, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchRoomQuestionCopyWith<_$_MatchRoomQuestion> get copyWith =>
      __$$_MatchRoomQuestionCopyWithImpl<_$_MatchRoomQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchRoomQuestionToJson(
      this,
    );
  }
}

abstract class _MatchRoomQuestion extends MatchRoomQuestion {
  const factory _MatchRoomQuestion(
      {required final String matchRoomQuestionId,
      required final String roomId,
      required final Question question,
      required final int order}) = _$_MatchRoomQuestion;
  const _MatchRoomQuestion._() : super._();

  factory _MatchRoomQuestion.fromJson(Map<String, dynamic> json) =
      _$_MatchRoomQuestion.fromJson;

  @override
  String get matchRoomQuestionId;
  @override
  String get roomId;
  @override
  Question get question;
  @override
  int get order;
  @override
  @JsonKey(ignore: true)
  _$$_MatchRoomQuestionCopyWith<_$_MatchRoomQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
