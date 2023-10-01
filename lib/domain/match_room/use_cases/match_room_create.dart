import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../entities/match_room.dart';
import '../repositories/match_room_repository.dart';

final matchRoomCreateProvider = Provider.autoDispose(MatchRoomCreate.new);

class MatchRoomCreate {
  const MatchRoomCreate(this._ref);
  final Ref _ref;

  Future<MatchRoom> call() async {
    return _ref.read(matchRoomRepository).create(
          MatchRoom(
            matchRoomId: const Uuid().v4(),
            ownerId: _ref.read(currentAppUserNotifierProvider).getUserId(),
            invitationId: 'invitationId',
            isStart: false,
          ),
        );
  }
}
