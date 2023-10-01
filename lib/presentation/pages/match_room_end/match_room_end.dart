import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/color/custom_colors.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/buttons/rounded_button.dart';

class MatchRoomEndPage extends ConsumerWidget {
  const MatchRoomEndPage._();

  static const routeName = '/match_room_end';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MatchRoomEndPage._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const username = 'ユーザ名'; // TODO
    const correct = 6; // TODO
    const total = 10; // TODO

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '結果発表',
          style: customTextTheme.body5.w6,
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Assets.images.png.resultHeaderImage.image(),
                const SizedBox(height: 32),
                Text(
                  username,
                  style: customTextTheme.body4.w6,
                ),
                const SizedBox(height: 4),
                Text(
                  '基本情報技術者試験の勉強',
                  style: customTextTheme.caption3.w6.copyWith(
                    color: CustomColors.primaryMain,
                  ),
                ),
                const SizedBox(height: 4),
                Assets.images.svg.userIcon.svg(),
                const SizedBox(height: 4),
                Text('$correct問正解でした', style: customTextTheme.header4),
                const SizedBox(
                  width: 83,
                  child: Divider(thickness: 2),
                ),
                Text('$total問中', style: customTextTheme.body2.w6),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RoundedButton(
                    height: 48,
                    width: constraints.maxWidth,
                    onTap: () {},
                    child: const Text('閉じる'),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'もう一度テスト画面を見る',
                  style: customTextTheme.caption1.w6,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
