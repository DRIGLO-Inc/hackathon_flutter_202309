import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../entities/match_room_result.dart';
import 'match_room_chat_notifier.dart';

final matchRoomResultProvider =
    Provider.autoDispose.family<MatchRoomResult, String>((ref, arg) {
  final list =
      ref.read(matchRoomChatListNotifierProvider(arg)).valueOrNull ?? [];
  final userId = ref.read(currentAppUserNotifierProvider).getUserId();
  final total = list.length;

  final result = list
      .map((e) => e.userAnswerList)
      .flattened
      .where((e) => e.isCorrect && e.userId == userId)
      .length;

  return MatchRoomResult(
    total: total,
    result: result,
  );
});
