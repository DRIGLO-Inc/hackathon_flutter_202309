// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_room_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchRoomChat {
  MatchRoomQuestion get matchRoomQuestion => throw _privateConstructorUsedError;
  List<UserAnswer> get userAnswerList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchRoomChatCopyWith<MatchRoomChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRoomChatCopyWith<$Res> {
  factory $MatchRoomChatCopyWith(
          MatchRoomChat value, $Res Function(MatchRoomChat) then) =
      _$MatchRoomChatCopyWithImpl<$Res, MatchRoomChat>;
  @useResult
  $Res call(
      {MatchRoomQuestion matchRoomQuestion, List<UserAnswer> userAnswerList});

  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion;
}

/// @nodoc
class _$MatchRoomChatCopyWithImpl<$Res, $Val extends MatchRoomChat>
    implements $MatchRoomChatCopyWith<$Res> {
  _$MatchRoomChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchRoomQuestion = null,
    Object? userAnswerList = null,
  }) {
    return _then(_value.copyWith(
      matchRoomQuestion: null == matchRoomQuestion
          ? _value.matchRoomQuestion
          : matchRoomQuestion // ignore: cast_nullable_to_non_nullable
              as MatchRoomQuestion,
      userAnswerList: null == userAnswerList
          ? _value.userAnswerList
          : userAnswerList // ignore: cast_nullable_to_non_nullable
              as List<UserAnswer>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion {
    return $MatchRoomQuestionCopyWith<$Res>(_value.matchRoomQuestion, (value) {
      return _then(_value.copyWith(matchRoomQuestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MatchRoomChatCopyWith<$Res>
    implements $MatchRoomChatCopyWith<$Res> {
  factory _$$_MatchRoomChatCopyWith(
          _$_MatchRoomChat value, $Res Function(_$_MatchRoomChat) then) =
      __$$_MatchRoomChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MatchRoomQuestion matchRoomQuestion, List<UserAnswer> userAnswerList});

  @override
  $MatchRoomQuestionCopyWith<$Res> get matchRoomQuestion;
}

/// @nodoc
class __$$_MatchRoomChatCopyWithImpl<$Res>
    extends _$MatchRoomChatCopyWithImpl<$Res, _$_MatchRoomChat>
    implements _$$_MatchRoomChatCopyWith<$Res> {
  __$$_MatchRoomChatCopyWithImpl(
      _$_MatchRoomChat _value, $Res Function(_$_MatchRoomChat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchRoomQuestion = null,
    Object? userAnswerList = null,
  }) {
    return _then(_$_MatchRoomChat(
      matchRoomQuestion: null == matchRoomQuestion
          ? _value.matchRoomQuestion
          : matchRoomQuestion // ignore: cast_nullable_to_non_nullable
              as MatchRoomQuestion,
      userAnswerList: null == userAnswerList
          ? _value._userAnswerList
          : userAnswerList // ignore: cast_nullable_to_non_nullable
              as List<UserAnswer>,
    ));
  }
}

/// @nodoc

class _$_MatchRoomChat extends _MatchRoomChat {
  const _$_MatchRoomChat(
      {required this.matchRoomQuestion,
      final List<UserAnswer> userAnswerList = const []})
      : _userAnswerList = userAnswerList,
        super._();

  @override
  final MatchRoomQuestion matchRoomQuestion;
  final List<UserAnswer> _userAnswerList;
  @override
  @JsonKey()
  List<UserAnswer> get userAnswerList {
    if (_userAnswerList is EqualUnmodifiableListView) return _userAnswerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswerList);
  }

  @override
  String toString() {
    return 'MatchRoomChat(matchRoomQuestion: $matchRoomQuestion, userAnswerList: $userAnswerList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchRoomChat &&
            (identical(other.matchRoomQuestion, matchRoomQuestion) ||
                other.matchRoomQuestion == matchRoomQuestion) &&
            const DeepCollectionEquality()
                .equals(other._userAnswerList, _userAnswerList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matchRoomQuestion,
      const DeepCollectionEquality().hash(_userAnswerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchRoomChatCopyWith<_$_MatchRoomChat> get copyWith =>
      __$$_MatchRoomChatCopyWithImpl<_$_MatchRoomChat>(this, _$identity);
}

abstract class _MatchRoomChat extends MatchRoomChat {
  const factory _MatchRoomChat(
      {required final MatchRoomQuestion matchRoomQuestion,
      final List<UserAnswer> userAnswerList}) = _$_MatchRoomChat;
  const _MatchRoomChat._() : super._();

  @override
  MatchRoomQuestion get matchRoomQuestion;
  @override
  List<UserAnswer> get userAnswerList;
  @override
  @JsonKey(ignore: true)
  _$$_MatchRoomChatCopyWith<_$_MatchRoomChat> get copyWith =>
      throw _privateConstructorUsedError;
}
