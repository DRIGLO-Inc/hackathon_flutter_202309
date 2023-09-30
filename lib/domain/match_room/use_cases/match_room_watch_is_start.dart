import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchRoomIsStartProvider = StreamProvider.autoDispose<bool>(
  (ref) =>
      // TODO(tsuda): 開始中かどうかを監視
      Stream.value(true),
);
