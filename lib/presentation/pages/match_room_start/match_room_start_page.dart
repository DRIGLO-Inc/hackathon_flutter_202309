import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/match_room/use_cases/match_room_watch_is_start.dart';
import '../../widgets/dialogs/ok_cancel_dialog.dart';
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
        return WillPopScope(
          onWillPop: () async {
            return OkCancelDialog.show(
              context,
              args: const OkCancelDialogArgs(
                title: '退出しちゃいますか😢？',
                content: '主じゃないメンバーが画面を閉じようとしたときにでるダイアログの予定（文言は挙動に合わせます）',
                cancelLabel: '退出しない',
                okLabel: '退出する',
              ),
            ).then((value) => value ?? false);
          },
          child: isStart
              ? const MatchRoomAfterStartView()
              : const MatchRoomBeforeStartView(),
        );
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
