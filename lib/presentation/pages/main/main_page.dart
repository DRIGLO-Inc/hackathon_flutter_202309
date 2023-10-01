import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/main/entities/main_state.dart';
import '../../../domain/main/use_cases/main_notifier.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/forms/search_text_field.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import '../question_adding_genre_selecting_page/question_adding_genre_selecting_page.dart';
import 'widgets/drawer.dart';
import 'widgets/select_genre_card_list.dart';
import 'widgets/select_room_card_list.dart';
import 'widgets/sliver_header_image.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static const routeName = '/main';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MainPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainNotifier = ref.watch(mainNotifierProvider);

    return mainNotifier.when(
      data: (mainState) => _Body(),
      error: (_, __) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('エラーが発生しました'),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainNotifier =
        ref.watch(mainNotifierProvider).value ?? const MainState();

    return UnfocusGestureDetector(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.large(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.of(context).push(
              QuestionAddingGenreSelectingPage.route(),
            );
          },
          child: Text('テストを\nつくる', style: customTextTheme.body5.w6),
        ),
        drawer: const MainPageDrawer(),
        body: CustomScrollView(
          slivers: [
            const SliverHeaderImage(),
            SliverList.list(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'すぐ入室可能なテストルーム',
                    style: customTextTheme.body5.w6,
                  ),
                ),
                const SizedBox(height: 8),
                SelectRoomCardList(
                  enableEnterRoomList: mainNotifier.enableEnterMatchRooms,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'テストのジャンルを探す',
                    style: customTextTheme.body5.w6,
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SearchTextField(hintText: 'テストジャンルまたはIDを入力'),
                ),
                const SizedBox(height: 24),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                24,
                0,
                24,
                MediaQuery.paddingOf(context).bottom + 96,
              ),
              sliver: SelectGenreCardList(
                mainState: mainNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
