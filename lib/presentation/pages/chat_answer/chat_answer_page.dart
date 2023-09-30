import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/extensions/build_context_ex.dart';
import '../../widgets/form/rounded_rectangle_text_from.dart';
import '../match_room_start/widgets/chat_answer_app_bar.dart';
import '../match_room_start/widgets/chat_bubble.dart';
import '../match_room_start/widgets/timer_counter.dart';

class ChatAnswerPage extends ConsumerStatefulWidget {
  const ChatAnswerPage._();

  static const String routeName = '/chat_answer_page';

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const ChatAnswerPage._(),
        settings: const RouteSettings(name: routeName),
      );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatAnswerPageState();
}

class _ChatAnswerPageState extends ConsumerState<ChatAnswerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO(Tani1015): notifierに移す
    final chatController = TextEditingController();

    return Scaffold(
      appBar: const ChatAnswerAppBar(
        child: Text('title'),
      ),
      body: GestureDetector(
        onTap: context.unfocus,
        child: const Stack(),
      ),
      bottomNavigationBar: KeyboardVisibilityBuilder(
        builder: (_, visible) => AnimatedContainer(
          color: Colors.deepPurpleAccent.withOpacity(0.2),
          duration: Duration.zero,
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            visible ? MediaQuery.of(context).viewInsets.bottom + 16 : 32,
          ),
          child: RoundedRectangleTextForm(
            controller: chatController,
            minLines: 1,
            maxLines: 8,
            textHeight: 1.3,
          ),
        ),
      ),
    );
  }
}
