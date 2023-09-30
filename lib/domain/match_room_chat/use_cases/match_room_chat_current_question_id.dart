import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'match_room_chat_notifier.dart';

final matchRoomChatCurrentQuestionIdProvider =
    StateProvider.autoDispose<String?>(
  (ref) {
    return ref
        .watch(matchRoomChatListNotifierProvider)
        .valueOrNull
        ?.lastOrNull
        ?.matchRoomQuestion
        .question
        .questionId;
  },
);
