import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchRoomAnsweredQuestionIdsProvider =
    StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
