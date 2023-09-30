// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String get userId => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  @SecondsDurationConverter()
  Duration? get durationTakenToAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {String userId,
      bool isCorrect,
      @SecondsDurationConverter() Duration? durationTakenToAnswer});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isCorrect = null,
    Object? durationTakenToAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      durationTakenToAnswer: freezed == durationTakenToAnswer
          ? _value.durationTakenToAnswer
          : durationTakenToAnswer // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool isCorrect,
      @SecondsDurationConverter() Duration? durationTakenToAnswer});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isCorrect = null,
    Object? durationTakenToAnswer = freezed,
  }) {
    return _then(_$_Answer(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      durationTakenToAnswer: freezed == durationTakenToAnswer
          ? _value.durationTakenToAnswer
          : durationTakenToAnswer // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Answer extends _Answer {
  const _$_Answer(
      {required this.userId,
      required this.isCorrect,
      @SecondsDurationConverter() this.durationTakenToAnswer})
      : super._();

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  final String userId;
  @override
  final bool isCorrect;
  @override
  @SecondsDurationConverter()
  final Duration? durationTakenToAnswer;

  @override
  String toString() {
    return 'Answer(userId: $userId, isCorrect: $isCorrect, durationTakenToAnswer: $durationTakenToAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.durationTakenToAnswer, durationTakenToAnswer) ||
                other.durationTakenToAnswer == durationTakenToAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, isCorrect, durationTakenToAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer extends Answer {
  const factory _Answer(
          {required final String userId,
          required final bool isCorrect,
          @SecondsDurationConverter() final Duration? durationTakenToAnswer}) =
      _$_Answer;
  const _Answer._() : super._();

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String get userId;
  @override
  bool get isCorrect;
  @override
  @SecondsDurationConverter()
  Duration? get durationTakenToAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
