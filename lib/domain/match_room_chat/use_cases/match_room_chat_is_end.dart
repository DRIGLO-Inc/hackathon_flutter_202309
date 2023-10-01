import 'package:flutter_riverpod/flutter_riverpod.dart';

final matchRoomChatIsEndNotifierProvider =
    StateProvider.autoDispose<bool>((_) => false);
