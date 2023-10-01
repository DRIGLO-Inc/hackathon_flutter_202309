import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/question_adding/question_adding_page_providers.dart';
import '../../../gen/colors.gen.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/dialogs/ok_dialog.dart';

const _kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16);

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
    final safeAreaPadding = MediaQuery.paddingOf(context).bottom;

    final editingQuestionUuids =
        ref.watch(editingQuestionUuidsNotifierProvider);
    final editingQuestionUuidsNotifier =
        ref.watch(editingQuestionUuidsNotifierProvider.notifier);
    final selectedGenre = ref.watch(selectedGenreProvider);

    return GestureDetector(
      onTap: () {
        final currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${selectedGenre.genreName}の質問を登録する'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 48,
          child: FilledButton(
            child: Text(
              '登録完了する',
              style: customTextTheme.body5.w6,
            ),
            // TODO(ogino): 登録ロジック
            onPressed: () async {
              await OkDialog.show(
                context,
                args: OkDialogArgs(
                  title: '登録完了しました！',
                  content:
                      '${selectedGenre.genreName}のテストを追加しました。ご協力ありがとうございます！',
                  okLabel: '閉じる',
                ),
              );
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Center(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 2)),
              SliverToBoxAdapter(
                child: Container(
                  margin: _kHorizontalPadding,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: ColorName.yellowSecondary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '💡Tips!',
                        style: customTextTheme.caption2.w6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                      // ignore: lines_longer_than_80_chars
                        '質問と回答をセットで登録してください。\n回答はいくつかの種類がある場合や、漢字、ひらがな、カタカナなどの表記揺れをカンマ区切りで複数登録することができます！',
                        style: customTextTheme.caption2,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 2)),
              SliverList.separated(
                itemCount: editingQuestionUuids.length,
                separatorBuilder: (context, index) {
                  return const Column(
                    children: [
                      SizedBox(height: 20),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: ColorName.gray100,
                      ),
                    ],
                  );
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: _kHorizontalPadding,
                    child: Consumer(
                      builder: (_, ref, __) {
                        return _QuestionAddingForm(
                          uuid: editingQuestionUuids[index],
                          canRemove: editingQuestionUuids.length != 1,
                        );
                      },
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: FilledButton.icon(
                      onPressed: editingQuestionUuidsNotifier.addQuestion,
                      icon: const Icon(Icons.add),
                      label: const Text('質問を追加'),
                      style: FilledButton.styleFrom(
                        backgroundColor: ColorName.gray100,
                        foregroundColor: ColorName.gray700,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: (safeAreaPadding * 2) + 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuestionAddingForm extends ConsumerStatefulWidget {
  const _QuestionAddingForm({
    required this.uuid,
    required this.canRemove,
  });

  final String uuid;
  final bool canRemove;

  @override
  ConsumerState<_QuestionAddingForm> createState() =>
      __QuestionAddingFormState();
}

class __QuestionAddingFormState extends ConsumerState<_QuestionAddingForm> {
  final questionTextCtr = TextEditingController();
  final answerTextCtr = TextEditingController();

  @override
  void initState() {
    questionTextCtr.addListener(() {
      ref.read(editingQuestionProviderFamily(widget.uuid).notifier).update(
            (state) => state = state.copyWith(title: questionTextCtr.text),
          );
    });
    answerTextCtr.addListener(() {
      ref.read(editingQuestionProviderFamily(widget.uuid).notifier).update(
            (state) => state = state.copyWith(answer: answerTextCtr.text),
          );
    });

    super.initState();
  }

  @override
  void dispose() {
    questionTextCtr.dispose();
    answerTextCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    questionTextCtr.text =
        ref.watch(editingQuestionProviderFamily(widget.uuid)).title;
    answerTextCtr.text =
        ref.watch(editingQuestionProviderFamily(widget.uuid)).answer;

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '質問文を入力してください',
              style: customTextTheme.body5.w6,
            ),
            if (widget.canRemove)
              InkWell(
                borderRadius: BorderRadius.circular(2),
                onTap: () {
                  ref
                      .read(editingQuestionUuidsNotifierProvider.notifier)
                      .removeQuestion(widget.uuid);
                },
                child: Text(
                  '削除',
                  style: customTextTheme.body5.w6.copyWith(
                    color: ColorName.redAccent,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: questionTextCtr,
          minLines: 4,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'OpenAIの創業者兼CEOとして知られるアメリカの起業家の名前は？',
            hintStyle: customTextTheme.body5,
            hintMaxLines: 4,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorName.gray200,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: false,
          ),
          style: customTextTheme.body5,
          maxLength: 150,
        ),
        const SizedBox(height: 10),
        Text(
          '回答を入力してください（カンマ区切りで複数登録可）',
          style: customTextTheme.body5.w6,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: answerTextCtr,
          minLines: 4,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'サムアルトマン,アルトマン,サミュエル・H・アルトマン,Samuel H. Altman',
            hintStyle: customTextTheme.body5,
            hintMaxLines: 4,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorName.gray200,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: false,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
