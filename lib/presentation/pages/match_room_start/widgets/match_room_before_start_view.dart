import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room/use_cases/match_room_start.dart';
import '../../../../utils/extensions/build_context_ex.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/typography/typography.dart';
import '../match_room_start_page.dart';
import 'chat_answer_app_bar.dart';

class MatchRoomBeforeStartView extends ConsumerWidget {
  const MatchRoomBeforeStartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageArgs = context.pageArgs<MatchRoomStartPageArgs>();

    return Scaffold(
      appBar: const ChatAnswerAppBar(
        child: Text(
          // TODO(Tani1025): ジャンル名を取得する。
          'ジャンル名がここに入る長い場合はellipsisにする',
          style: TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ルームID：${pageArgs.matchRoom.invitationId}',
                  style: customTextTheme.body1.w6,
                ),
                const SizedBox(height: 24),
                Text(
                  '他の人の参加を待機中\n1人で始めることもできます',
                  style: customTextTheme.body3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      ref.read(matchRoomStartProvider)(
                        pageArgs.matchRoom.matchRoomId,
                      );
                    },
                    child: const Text('テスト開始！'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
