import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionCreateProvider = Provider.autoDispose(QuestionCreate.new);

class QuestionCreate {
  const QuestionCreate(this._ref);
  final Ref _ref;

  Future<void> call() async {
    // TODO(tsuda): 問題の作成の実装
    // ignore: unnecessary_statements
    _ref;
  }
}
