import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/auth/use_cases/current_app_user/current_app_user_notifier.dart';
import '../../../../domain/match_room_chat/entities/match_room_chat.dart';
import '../../../../domain/match_room_chat/use_cases/match_room_chat_answered_questions.dart';
import '../../../../domain/match_room_chat/use_cases/match_room_chat_is_end.dart';
import '../../../../domain/match_room_chat/use_cases/match_room_chat_notifier.dart';
import '../../../../domain/user_answer/use_cases/user_answer_save.dart';
import '../../../../utils/extensions/build_context_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../widgets/dialogs/ok_cancel_dialog.dart';
import '../../../widgets/unfocus_gesture_detector.dart';
import '../../match_room_end/match_room_end.dart';
import '../match_room_start_page.dart';
import 'chat_answer_app_bar.dart';
import 'chat_bubble.dart';
import 'timer_counter.dart';

class MatchRoomAfterStartView extends ConsumerStatefulWidget {
  const MatchRoomAfterStartView({super.key});

  @override
  ConsumerState<MatchRoomAfterStartView> createState() =>
      _MatchRoomAfterStartViewState();
}

class _MatchRoomAfterStartViewState
    extends ConsumerState<MatchRoomAfterStartView> {
  final _chatController = TextEditingController();
  final _asyncCache = AsyncCache<void>.ephemeral();

  void _send(String value) {
    if (value.isEmpty) {
      return;
    }
    final matchRoomId =
        context.pageArgs<MatchRoomStartPageArgs>().matchRoom.matchRoomId;

    ref.read(userAnswerSaveProvider)(
      value,
      matchRoomQuestion: ref
          .read(matchRoomChatListNotifierProvider(matchRoomId))
          .asData!
          .value
          .last
          .matchRoomQuestion,
    );

    context.unfocus();
    _chatController.clear();
  }

  @override
  void initState() {
    ref.listenManual(matchRoomChatIsEndNotifierProvider, (_, isEnd) {
      if (isEnd) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _asyncCache.fetch(
            () => OkCancelDialog.show(
              context,
              args: const OkCancelDialogArgs(
                title: 'お疲れ様でした！',
                content: '結果を見ますか？',
                cancelLabel: 'キャンセル',
                okLabel: '見る',
              ),
            ).then((value) {
              if (value == true && context.mounted) {
                Navigator.of(context).push(
                  MatchRoomEndPage.route(
                    MatchRoomEndPageArgs(
                      matchRoomId: context
                          .pageArgs<MatchRoomStartPageArgs>()
                          .matchRoom
                          .matchRoomId,
                    ),
                  ),
                );
              }
            }),
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusGestureDetector(
      child: Scaffold(
        appBar: const ChatAnswerAppBar(
          child: Text(
            // TODO(Tani1025): ジャンル名を取得する。
            'IT',
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
                      child: TimerCounter(),
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
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _chatController,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: _send,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: CustomColors.grayShade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: CustomColors.primaryMain,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 56,
                    child: FilledButton(
                      onPressed: () {
                        _send(_chatController.text);
                      },
                      style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ),
                ],
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
    final matchRoomId =
        context.pageArgs<MatchRoomStartPageArgs>().matchRoom.matchRoomId;
    final list =
        ref.watch(matchRoomChatListNotifierProvider(matchRoomId)).value ?? [];

    return CustomScrollView(
      reverse: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          // FIXME: SliverAnimatedList に変更
          sliver: SliverList.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 8),
            itemCount: list.length,
            itemBuilder: (_, index) {
              return _ListTile(
                matchRoomChat: list.reversed.toList()[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ListTile extends ConsumerWidget {
  const _ListTile({required this.matchRoomChat});

  final MatchRoomChat matchRoomChat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAnswer = ref.watch(matchRoomAnsweredQuestionIdsProvider).any(
          (element) =>
              element == matchRoomChat.matchRoomQuestion.matchRoomQuestionId,
        );

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Column(
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
          if (showAnswer)
            _Message(
              content: '答え：${matchRoomChat.matchRoomQuestion.question.answer}',
              crossAxisAlignment: CrossAxisAlignment.start,
              chatBubbleDecoration: ChatBubbleDecoration.outlined,
            ),
          ...matchRoomChat.userAnswerList.map((userAnswer) {
            final ownUserId =
                ref.watch(currentAppUserNotifierProvider).getUserId();

            final hideContent =
                ownUserId != userAnswer.userId && userAnswer.isCorrect;

            return _Message(
              name: userAnswer.userId ==
                      ref.watch(currentAppUserNotifierProvider).getUserId()
                  ? 'あなた'
                  : '他ユーザー',
              content: hideContent
                  ? '''ｱﾀｯﾀ!! ＼( 'ω')／ ｱﾀｯﾀ!!'''
                  : userAnswer.userAnswer,
              crossAxisAlignment: CrossAxisAlignment.end,
              chatBubbleDecoration: userAnswer.isCorrect
                  ? ChatBubbleDecoration.filledPrimary
                  : ChatBubbleDecoration.filledGray,
            );
          }),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    this.name,
    required this.content,
    required this.crossAxisAlignment,
    required this.chatBubbleDecoration,
  });

  final String? name;
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
            if (name case final name?) ...[
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
            ],
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
