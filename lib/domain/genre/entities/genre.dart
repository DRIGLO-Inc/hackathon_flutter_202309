// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  const factory Genre({
    required String genreId,
    required String genreName,
  }) = _Genre;

  const Genre._();
  factory Genre.fromJson(Map<String, Object?> json) => _$GenreFromJson(json);

}
