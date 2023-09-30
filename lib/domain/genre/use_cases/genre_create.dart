import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreCreateProvider = Provider.autoDispose(GenreCreate.new);

class GenreCreate {
  const GenreCreate(this._ref);
  final Ref _ref;

  Future<void> call() async {
    // TODO(tsuda): ジャンルの作成実装
  }
}
