import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/match_room_repository.dart';

final matchRoomStartProvider = Provider.autoDispose(MatchRoomStart.new);

class MatchRoomStart {
  const MatchRoomStart(this._ref);
  final Ref _ref;

  Future<void> call(String id) async {
    await _ref.read(matchRoomRepository).start(id);
  }
}
