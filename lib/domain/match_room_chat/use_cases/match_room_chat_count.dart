import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchRoomCountProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MatchRoomChatCount {
  const MatchRoomChatCount._();

  static const maxCount = 15;
}
