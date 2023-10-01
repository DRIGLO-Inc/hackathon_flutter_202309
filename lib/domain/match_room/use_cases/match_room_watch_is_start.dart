import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/match_room_repository.dart';

final matchRoomIsStartProvider =
    StreamProvider.autoDispose.family<bool, String>(
  (ref, arg) => ref
      .read(matchRoomRepository)
      .watch(arg)
      .asyncMap((event) => event.isStart),
);
