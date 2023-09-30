import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room_chat/entities/match_room_chat.dart';
import '../../../../domain/match_room_chat/use_cases/match_room_chat_notifier.dart';
import '../../../widgets/form/rounded_rectangle_text_from.dart';
import '../../../widgets/unfocus_gesture_detector.dart';
import 'chat_answer_app_bar.dart';
import 'chat_bubble.dart';
import 'timer_counter.dart';

class MatchRoomAfterStartView extends StatelessWidget {
  const MatchRoomAfterStartView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = TextEditingController();

    return UnfocusGestureDetector(
      child: Scaffold(
        appBar: const ChatAnswerAppBar(
          child: Text(
            // TODO(Tani1025): ジャンル名を取得する。
            'ジャンル名がここに入る長い場合はellipsisにする',
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  _Body(),
                  const Positioned(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                      ),
                      child: TimerCounter(counter: 10),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ) +
                  EdgeInsets.only(
                    bottom: MediaQuery.paddingOf(context).bottom + 16,
                  ),
              child: RoundedRectangleTextForm(
                controller: chatController,
                minLines: 1,
                maxLines: 8,
                textHeight: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(matchRoomChatListNotifier).value ?? [];

    return CustomScrollView(
      reverse: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          sliver: SliverList.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 8),
            itemCount: list.length,
            itemBuilder: (_, index) {
              return _ListTile(matchRoomChat: list.reversed.toList()[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({required this.matchRoomChat});

  final MatchRoomChat matchRoomChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: _Message(
            crossAxisAlignment: CrossAxisAlignment.start,
            name: '${matchRoomChat.matchRoomQuestion.order}個目の質問',
            content: matchRoomChat.matchRoomQuestion.question.title,
            chatBubbleDecoration: ChatBubbleDecoration.outlined,
          ),
        ),
        // TODO(tsuda): 時間経過
        _Message(
          name: matchRoomChat.matchRoomQuestion.question.answer,
          content: matchRoomChat.matchRoomQuestion.question.answer,
          crossAxisAlignment: CrossAxisAlignment.start,
          chatBubbleDecoration: ChatBubbleDecoration.outlined,
        ),
        ...matchRoomChat.userAnswerList.map((userAnswer) {
          return _Message(
            name: userAnswer.user.userName,
            content: userAnswer.answer,
            crossAxisAlignment: CrossAxisAlignment.end,
            chatBubbleDecoration: ChatBubbleDecoration.filledPrimary,
          );
        }),
      ],
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.name,
    required this.content,
    required this.crossAxisAlignment,
    required this.chatBubbleDecoration,
  });

  final String name;
  final String content;
  final CrossAxisAlignment crossAxisAlignment;
  final ChatBubbleDecoration chatBubbleDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ChatBubble(
              text: content,
              decoration: chatBubbleDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
