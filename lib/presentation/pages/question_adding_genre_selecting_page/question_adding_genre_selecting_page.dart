import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('質問を追加する'),
      ),
      body: const CustomScrollView(),
    );
  }
}
