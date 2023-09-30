// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  String get genreId => throw _privateConstructorUsedError;
  String get genreName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({String genreId, String genreName});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreId = null,
    Object? genreName = null,
  }) {
    return _then(_value.copyWith(
      genreId: null == genreId
          ? _value.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      genreName: null == genreName
          ? _value.genreName
          : genreName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$_GenreCopyWith(_$_Genre value, $Res Function(_$_Genre) then) =
      __$$_GenreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String genreId, String genreName});
}

/// @nodoc
class __$$_GenreCopyWithImpl<$Res> extends _$GenreCopyWithImpl<$Res, _$_Genre>
    implements _$$_GenreCopyWith<$Res> {
  __$$_GenreCopyWithImpl(_$_Genre _value, $Res Function(_$_Genre) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genreId = null,
    Object? genreName = null,
  }) {
    return _then(_$_Genre(
      genreId: null == genreId
          ? _value.genreId
          : genreId // ignore: cast_nullable_to_non_nullable
              as String,
      genreName: null == genreName
          ? _value.genreName
          : genreName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Genre extends _Genre {
  const _$_Genre({required this.genreId, required this.genreName}) : super._();

  factory _$_Genre.fromJson(Map<String, dynamic> json) =>
      _$$_GenreFromJson(json);

  @override
  final String genreId;
  @override
  final String genreName;

  @override
  String toString() {
    return 'Genre(genreId: $genreId, genreName: $genreName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Genre &&
            (identical(other.genreId, genreId) || other.genreId == genreId) &&
            (identical(other.genreName, genreName) ||
                other.genreName == genreName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, genreId, genreName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreCopyWith<_$_Genre> get copyWith =>
      __$$_GenreCopyWithImpl<_$_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreToJson(
      this,
    );
  }
}

abstract class _Genre extends Genre {
  const factory _Genre(
      {required final String genreId,
      required final String genreName}) = _$_Genre;
  const _Genre._() : super._();

  factory _Genre.fromJson(Map<String, dynamic> json) = _$_Genre.fromJson;

  @override
  String get genreId;
  @override
  String get genreName;
  @override
  @JsonKey(ignore: true)
  _$$_GenreCopyWith<_$_Genre> get copyWith =>
      throw _privateConstructorUsedError;
}
