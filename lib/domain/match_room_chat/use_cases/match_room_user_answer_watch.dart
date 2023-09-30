import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAnswerWatchProvider = StreamProvider.autoDispose(
  (ref) {
    return Stream.fromFuture(Future.delayed(const Duration(seconds: 1)));
  },
);
