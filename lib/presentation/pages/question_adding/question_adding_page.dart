import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/question_adding/question_adding_page_providers.dart';

class QuestionAddingPage extends ConsumerWidget {
  const QuestionAddingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editingQuestionsCount = ref.watch(editingQuestionsCountProvider);

    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: editingQuestionsCount,
              itemBuilder: (context, index) {
                return _SliverQuestionAddingForm(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverQuestionAddingForm extends ConsumerStatefulWidget {
  const _SliverQuestionAddingForm(this.index);

  final int index;

  @override
  ConsumerState<_SliverQuestionAddingForm> createState() =>
      __SliverQuestionAddingFormState();
}

class __SliverQuestionAddingFormState
    extends ConsumerState<_SliverQuestionAddingForm> {
  late final question = ref.watch(editingQuestionProviderFamily(widget.index));

  final questionTextCtr = TextEditingController();
  final answerTextCtr = TextEditingController();

  @override
  void initState() {
    questionTextCtr.addListener(() {
      ref
          .read(editingQuestionProviderFamily(widget.index).notifier)
          .update((state) => state.copyWith(title: questionTextCtr.text));
    });
    answerTextCtr.addListener(() {
      ref
          .read(editingQuestionProviderFamily(widget.index).notifier)
          .update((state) => state.copyWith(title: answerTextCtr.text));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Text('質問文を入力してください'),
          TextFormField(
            controller: questionTextCtr,
          ),
          const Text('回答を入力してください（カンマ区切りで複数登録可）'),
          TextFormField(
            controller: answerTextCtr,
          ),
        ],
      ),
    );
  }
}
