// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAnswer _$UserAnswerFromJson(Map<String, dynamic> json) {
  return _UserAnswer.fromJson(json);
}

/// @nodoc
mixin _$UserAnswer {
  String get userAnswerId => throw _privateConstructorUsedError;
  MatchRoomQuestion get matchRoomQuestion => throw _privateConstructorUsedError;
  UserData get user => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  @SecondsDurationConverter()
  Duration? get durationTakenToUserAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAnswerCopyWith<UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswerCopyWith<$Res> {
  factory $UserAnswerCopyWith(
          UserAnswer value, $Res Function(UserAnswer) then) =
      _$UserAnswerCopyWithImpl<$Res, UserAnswer>;
  @useResult
  $Res call(
      {String userAnswerId,
      MatchRoomQuestion matchRoomQuestion,
      UserData user,
      bool isCorrect,
      @SecondsDurationConverter() Duration? durationTakenToUserAnswer});

  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion;
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class _$UserAnswerCopyWithImpl<$Res, $Val extends UserAnswer>
    implements $UserAnswerCopyWith<$Res> {
  _$UserAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAnswerId = null,
    Object? matchRoomQuestion = null,
    Object? user = null,
    Object? isCorrect = null,
    Object? durationTakenToUserAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      userAnswerId: null == userAnswerId
          ? _value.userAnswerId
          : userAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchRoomQuestion: null == matchRoomQuestion
          ? _value.matchRoomQuestion
          : matchRoomQuestion // ignore: cast_nullable_to_non_nullable
              as MatchRoomQuestion,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      durationTakenToUserAnswer: freezed == durationTakenToUserAnswer
          ? _value.durationTakenToUserAnswer
          : durationTakenToUserAnswer // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion {
    return $MatchRoomQuestionCopyWith<$Res>(_value.matchRoomQuestion, (value) {
      return _then(_value.copyWith(matchRoomQuestion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserAnswerCopyWith<$Res>
    implements $UserAnswerCopyWith<$Res> {
  factory _$$_UserAnswerCopyWith(
          _$_UserAnswer value, $Res Function(_$_UserAnswer) then) =
      __$$_UserAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userAnswerId,
      MatchRoomQuestion matchRoomQuestion,
      UserData user,
      bool isCorrect,
      @SecondsDurationConverter() Duration? durationTakenToUserAnswer});

  @override
  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion;
  @override
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserAnswerCopyWithImpl<$Res>
    extends _$UserAnswerCopyWithImpl<$Res, _$_UserAnswer>
    implements _$$_UserAnswerCopyWith<$Res> {
  __$$_UserAnswerCopyWithImpl(
      _$_UserAnswer _value, $Res Function(_$_UserAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAnswerId = null,
    Object? matchRoomQuestion = null,
    Object? user = null,
    Object? isCorrect = null,
    Object? durationTakenToUserAnswer = freezed,
  }) {
    return _then(_$_UserAnswer(
      userAnswerId: null == userAnswerId
          ? _value.userAnswerId
          : userAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      matchRoomQuestion: null == matchRoomQuestion
          ? _value.matchRoomQuestion
          : matchRoomQuestion // ignore: cast_nullable_to_non_nullable
              as MatchRoomQuestion,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      durationTakenToUserAnswer: freezed == durationTakenToUserAnswer
          ? _value.durationTakenToUserAnswer
          : durationTakenToUserAnswer // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAnswer extends _UserAnswer {
  const _$_UserAnswer(
      {required this.userAnswerId,
      required this.matchRoomQuestion,
      required this.user,
      required this.isCorrect,
      @SecondsDurationConverter() this.durationTakenToUserAnswer})
      : super._();

  factory _$_UserAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_UserAnswerFromJson(json);

  @override
  final String userAnswerId;
  @override
  final MatchRoomQuestion matchRoomQuestion;
  @override
  final UserData user;
  @override
  final bool isCorrect;
  @override
  @SecondsDurationConverter()
  final Duration? durationTakenToUserAnswer;

  @override
  String toString() {
    return 'UserAnswer(userAnswerId: $userAnswerId, matchRoomQuestion: $matchRoomQuestion, user: $user, isCorrect: $isCorrect, durationTakenToUserAnswer: $durationTakenToUserAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAnswer &&
            (identical(other.userAnswerId, userAnswerId) ||
                other.userAnswerId == userAnswerId) &&
            (identical(other.matchRoomQuestion, matchRoomQuestion) ||
                other.matchRoomQuestion == matchRoomQuestion) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.durationTakenToUserAnswer,
                    durationTakenToUserAnswer) ||
                other.durationTakenToUserAnswer == durationTakenToUserAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userAnswerId, matchRoomQuestion,
      user, isCorrect, durationTakenToUserAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAnswerCopyWith<_$_UserAnswer> get copyWith =>
      __$$_UserAnswerCopyWithImpl<_$_UserAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAnswerToJson(
      this,
    );
  }
}

abstract class _UserAnswer extends UserAnswer {
  const factory _UserAnswer(
      {required final String userAnswerId,
      required final MatchRoomQuestion matchRoomQuestion,
      required final UserData user,
      required final bool isCorrect,
      @SecondsDurationConverter()
      final Duration? durationTakenToUserAnswer}) = _$_UserAnswer;
  const _UserAnswer._() : super._();

  factory _UserAnswer.fromJson(Map<String, dynamic> json) =
      _$_UserAnswer.fromJson;

  @override
  String get userAnswerId;
  @override
  MatchRoomQuestion get matchRoomQuestion;
  @override
  UserData get user;
  @override
  bool get isCorrect;
  @override
  @SecondsDurationConverter()
  Duration? get durationTakenToUserAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_UserAnswerCopyWith<_$_UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
