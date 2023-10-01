// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MainState _$MainStateFromJson(Map<String, dynamic> json) {
  return _MainState.fromJson(json);
}

/// @nodoc
mixin _$MainState {
  List<MatchRoom> get enableEnterMatchRooms =>
      throw _privateConstructorUsedError; // TODO(Tani1015): ジャンル取得ではなくジャンルをクエリで問題を取得する。
  List<Genre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({List<MatchRoom> enableEnterMatchRooms, List<Genre> genres});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableEnterMatchRooms = null,
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      enableEnterMatchRooms: null == enableEnterMatchRooms
          ? _value.enableEnterMatchRooms
          : enableEnterMatchRooms // ignore: cast_nullable_to_non_nullable
              as List<MatchRoom>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainStateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$$_MainStateCopyWith(
          _$_MainState value, $Res Function(_$_MainState) then) =
      __$$_MainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchRoom> enableEnterMatchRooms, List<Genre> genres});
}

/// @nodoc
class __$$_MainStateCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainState>
    implements _$$_MainStateCopyWith<$Res> {
  __$$_MainStateCopyWithImpl(
      _$_MainState _value, $Res Function(_$_MainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableEnterMatchRooms = null,
    Object? genres = null,
  }) {
    return _then(_$_MainState(
      enableEnterMatchRooms: null == enableEnterMatchRooms
          ? _value._enableEnterMatchRooms
          : enableEnterMatchRooms // ignore: cast_nullable_to_non_nullable
              as List<MatchRoom>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainState extends _MainState {
  const _$_MainState(
      {final List<MatchRoom> enableEnterMatchRooms = const [],
      final List<Genre> genres = const []})
      : _enableEnterMatchRooms = enableEnterMatchRooms,
        _genres = genres,
        super._();

  factory _$_MainState.fromJson(Map<String, dynamic> json) =>
      _$$_MainStateFromJson(json);

  final List<MatchRoom> _enableEnterMatchRooms;
  @override
  @JsonKey()
  List<MatchRoom> get enableEnterMatchRooms {
    if (_enableEnterMatchRooms is EqualUnmodifiableListView)
      return _enableEnterMatchRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enableEnterMatchRooms);
  }

// TODO(Tani1015): ジャンル取得ではなくジャンルをクエリで問題を取得する。
  final List<Genre> _genres;
// TODO(Tani1015): ジャンル取得ではなくジャンルをクエリで問題を取得する。
  @override
  @JsonKey()
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'MainState(enableEnterMatchRooms: $enableEnterMatchRooms, genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainState &&
            const DeepCollectionEquality()
                .equals(other._enableEnterMatchRooms, _enableEnterMatchRooms) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_enableEnterMatchRooms),
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      __$$_MainStateCopyWithImpl<_$_MainState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MainStateToJson(
      this,
    );
  }
}

abstract class _MainState extends MainState {
  const factory _MainState(
      {final List<MatchRoom> enableEnterMatchRooms,
      final List<Genre> genres}) = _$_MainState;
  const _MainState._() : super._();

  factory _MainState.fromJson(Map<String, dynamic> json) =
      _$_MainState.fromJson;

  @override
  List<MatchRoom> get enableEnterMatchRooms;
  @override // TODO(Tani1015): ジャンル取得ではなくジャンルをクエリで問題を取得する。
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$_MainStateCopyWith<_$_MainState> get copyWith =>
      throw _privateConstructorUsedError;
}
