import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/match_room/use_cases/match_room_watch_is_start.dart';
import 'widgets/match_room_after_start_view.dart';
import 'widgets/match_room_before_start_view.dart';

class MatchRoomStartPageArgs {
  MatchRoomStartPageArgs({required this.matchRoomId});

  final String matchRoomId;
}

class MatchRoomStartPage extends ConsumerWidget {
  const MatchRoomStartPage._(this.args);

  final MatchRoomStartPageArgs args;

  static const routeName = '/match_room';

  static Route<void> route(MatchRoomStartPageArgs args) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => MatchRoomStartPage._(args),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStartAsync = ref.watch(matchRoomIsStartProvider);
    return isStartAsync.when(
      data: (isStart) {
        if (isStart) {
          return const MatchRoomAfterStartView();
        } else {
          return const MatchRoomBeforeStartView();
        }
      },
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('エラーが発生しました'),
        ),
      ),
    );
  }
}
