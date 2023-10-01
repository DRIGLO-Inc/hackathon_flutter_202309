import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'match_room_chat_notifier.dart';

final matchRoomChatCurrentQuestionIdProvider =
    StateProvider.autoDispose.family<String?, String>(
  (ref, arg) {
    return ref
        .watch(matchRoomChatListNotifierProvider(arg))
        .valueOrNull
        ?.lastOrNull
        ?.matchRoomQuestion
        .question
        .questionId;
  },
);
