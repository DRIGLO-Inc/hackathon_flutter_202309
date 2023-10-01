import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../entities/match_room.dart';

final matchRoomCreateProvider = Provider.autoDispose(MatchRoomCreate.new);

class MatchRoomCreate {
  const MatchRoomCreate(this._ref);
  final Ref _ref;

  Future<MatchRoom> call() async {
    return MatchRoom(
      matchRoomId: 'matchRoomId',
      ownerId: _ref.read(currentAppUserNotifierProvider).getUserId(),
      invitationId: 'invitationId',
      isStart: true,
    );
  }
}
