import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/question_adding/question_adding_page_providers.dart';

class QuestionAddingPage extends ConsumerWidget {
  const QuestionAddingPage._();

  static const routeName = '/question_adding_page';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const QuestionAddingPage._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editingQuestionUuids =
        ref.watch(editingQuestionUuidsNotifierProvider);
    final editingQuestionUuidsNotifier =
        ref.watch(editingQuestionUuidsNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: editingQuestionUuids.length,
              itemBuilder: (context, index) {
                return _SliverQuestionAddingForm(
                  uuid: editingQuestionUuids[index],
                  canRemove: editingQuestionUuids.length != 1,
                );
              },
            ),
            SliverToBoxAdapter(
              child: FilledButton.icon(
                onPressed: editingQuestionUuidsNotifier.addQuestion,
                icon: const Icon(Icons.add),
                label: const Text('質問を追加'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverQuestionAddingForm extends ConsumerStatefulWidget {
  const _SliverQuestionAddingForm({
    required this.uuid,
    required this.canRemove,
  });

  final String uuid;
  final bool canRemove;

  @override
  ConsumerState<_SliverQuestionAddingForm> createState() =>
      __SliverQuestionAddingFormState();
}

class __SliverQuestionAddingFormState
    extends ConsumerState<_SliverQuestionAddingForm> {
  late final question = ref.watch(editingQuestionProviderFamily(widget.uuid));

  final questionTextCtr = TextEditingController();
  final answerTextCtr = TextEditingController();

  @override
  void initState() {
    questionTextCtr.addListener(() {
      ref
          .read(editingQuestionProviderFamily(widget.uuid).notifier)
          .update((state) => state.copyWith(title: questionTextCtr.text));
    });
    answerTextCtr.addListener(() {
      ref
          .read(editingQuestionProviderFamily(widget.uuid).notifier)
          .update((state) => state.copyWith(title: answerTextCtr.text));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('質問文を入力してください'),
            if (widget.canRemove)
              TextButton(
                onPressed: () {
                  ref
                      .read(editingQuestionUuidsNotifierProvider.notifier)
                      .removeQuestion(widget.uuid);
                },
                child: const Text('削除'),
              ),
          ],
        ),
        TextFormField(
          controller: questionTextCtr,
        ),
        const Text('回答を入力してください（カンマ区切りで複数登録可）'),
        TextFormField(
          controller: answerTextCtr,
        ),
      ],
    );
  }
}
