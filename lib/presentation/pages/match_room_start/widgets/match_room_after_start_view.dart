import 'package:flutter/material.dart';

import '../../../../utils/extensions/build_context_ex.dart';
import '../../../widgets/form/rounded_rectangle_text_from.dart';
import 'chat_answer_app_bar.dart';
import 'chat_bubble.dart';
import 'timer_counter.dart';

class MatchRoomAfterStartView extends StatelessWidget {
  const MatchRoomAfterStartView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = TextEditingController();

    return GestureDetector(
      onTap: context.unfocus,
      child: Scaffold(
        // TODO(Tani1025): ジャンル名を取得する。
        appBar: const ChatAnswerAppBar(
          child: Text(
            'ジャンル名がここに入る長い場合はellipsisにする',
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.topRight,
              // TODO(Tani1025): stateに変更する
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: TimerCounter(counter: 10),
              ),
            ),
            _Body(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  MediaQuery.paddingOf(context).bottom + 16,
                ),
                child: RoundedRectangleTextForm(
                  controller: chatController,
                  minLines: 1,
                  maxLines: 8,
                  textHeight: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 64),
        ),
        // TODO(Tani1015): mockに変更
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          sliver: SliverList.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 8),
            itemCount: 2,
            itemBuilder: (_, index) {
              // TODO(Tani1015): チャットのユーザが自分か相手かを判定
              if (index == 0) {
                return const FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '?問目の問題',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      ChatBubble(
                        text: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちは',
                        isMe: false,
                      ),
                    ],
                  ),
                );
              }
              // TODO(Tani1015): チャットのユーザが自分か相手かを判定
              if (index == 1) {
                return const FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ユーザ名1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      ChatBubble(
                        text: 'こんにちは',
                        isMe: true,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
