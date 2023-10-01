import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/genre.dart';
import '../repositories/genre_repository.dart';

final genreFetchAllProvider = Provider.autoDispose(GenreFetchAll.new);

class GenreFetchAll {
  const GenreFetchAll(this._ref);
  final Ref _ref;

  Future<List<Genre>> call() async {
    return _ref.read(genreRepository).fetch();
  }
}
