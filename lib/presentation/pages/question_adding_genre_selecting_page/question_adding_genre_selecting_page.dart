import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/question_adding/question_adding_page_providers.dart';
import '../../../domain/genre/entities/genre.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/typography/typography.dart';
import '../question_adding/question_adding_page.dart';

// TODO(ogino): ダミーデータ
const _kQuestionsCount = 8;

class QuestionAddingGenreSelectingPage extends ConsumerWidget {
  const QuestionAddingGenreSelectingPage._();

  static const routeName = '/question_adding_genre_selecting_page';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const QuestionAddingGenreSelectingPage._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreList = ref.watch(genreListProvider);
    final selectedGenreNotifier = ref.watch(selectedGenreProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('質問を追加する'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Assets.images.png.questionAddingHeader.image(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 44)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'どのジャンルの質問を登録しますか？',
                style: customTextTheme.body5.w6,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          genreList.when(
            data: (data) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 100,
                  ),
                  itemBuilder: (context, index) {
                    return _GenrePanel(
                      genre: data[index],
                      onTap: (genre) {
                        selectedGenreNotifier.update(
                          (state) => state = genre,
                        );
                        Navigator.of(context).push(QuestionAddingPage.route());
                      },
                    );
                  },
                  itemCount: data.length,
                ),
              );
            },
            error: (_, __) {
              return const Center(
                child: Text('データの取得に失敗しました。'),
              );
            },
            loading: () {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _GenrePanel extends StatelessWidget {
  const _GenrePanel({required this.genre, required this.onTap});

  final Genre genre;
  final ValueChanged<Genre> onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(genre),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Text(
                  genre.genreName,
                  style: customTextTheme.body5.w6,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 20,
                width: double.infinity,
                child: Text(
                  '登録問題：$_kQuestionsCount問',
                  style: customTextTheme.caption3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
