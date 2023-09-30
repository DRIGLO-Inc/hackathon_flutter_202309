import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'match_room_chat_current_question_id.dart';

final matchRoomCountProvider = StreamProvider.autoDispose<int>((ref) {
  // 新しい問題になるたびにタイマーをリセットする
  ref.watch(matchRoomChatCurrentQuestionIdProvider);

  return Stream.fromFutures([
    Future.delayed(Duration.zero, () => 0),
    for (var second = 1; second <= MatchRoomCount.maxCount; second++)
      Future.delayed(Duration(seconds: second), () => second),
  ]);
});

class MatchRoomCount {
  const MatchRoomCount._();

  static const maxCount = 15;
}
