import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreSearchProvider = Provider.autoDispose(GenreSearch.new);

class GenreSearch {
  const GenreSearch(this._ref);
  final Ref _ref;

  Future<void> call() async {
    // TODO(tsuda): ジャンルの検索
    // ignore: unnecessary_statements
    _ref;
  }
}
