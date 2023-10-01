import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/genre.dart';
import '../repositories/genre_repository.dart';

final genreFetchByGenreProvider = Provider.autoDispose(GenreFetchByGenre.new);

class GenreFetchByGenre {
  const GenreFetchByGenre(this._ref);
  final Ref _ref;

  Future<List<Genre>> call(Genre genre) async {
    return _ref.read(genreRepository).fetch(genre: genre);
  }
}
