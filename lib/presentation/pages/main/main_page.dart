import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/auth/use_cases/sign_out/sign_out.dart';
import '../../../utils/extensions/navigator_state_ex.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/forms/search_text_field.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import '../auth_sign_in/auth_sign_in_page.dart';
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
    return UnfocusGestureDetector(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.large(
          shape: const StadiumBorder(),
          // TODO(Tani1015): 問題作成画面へ遷移に変更
          onPressed: () async {
            await ref.read(signOutProvider)();

            if (context.mounted) {
              await Navigator.of(context).pushAndRemoveAll(
                AuthSignInPage.route(const AuthSignInPageArgs()),
              );
            }
          },
          child: Text('テストを\nつくる', style: customTextTheme.body5.w6),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverHeaderImage(),
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'すぐ入室可能なテストルーム',
                    style: customTextTheme.body5.w6,
                  ),
                ),
                const SizedBox(height: 8),
                const SelectRoomCardList(),
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
              sliver: const SelectGenreCardList(),
            ),
          ],
        ),
      ),
    );
  }
}
