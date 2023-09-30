import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchRoomStartProvider = Provider.autoDispose(MatchRoomStart.new);

class MatchRoomStart {
  const MatchRoomStart(this._ref);
  final Ref _ref;

  Future<void> call() async {
    // TODO(tsuda): マッチの開始の実装
  }
}
