import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/match_room_repository.dart';

final matchRoomListProvider = StreamProvider.autoDispose((ref) {
  return ref.read(matchRoomRepository).list();
});
