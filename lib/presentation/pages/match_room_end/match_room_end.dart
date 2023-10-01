import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/match_room_chat/use_cases/match_room_result_provider.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/color/custom_colors.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/buttons/rounded_button.dart';

class MatchRoomEndPageArgs extends Equatable {
  const MatchRoomEndPageArgs({required this.matchRoomId});

  final String matchRoomId;

  @override
  List<Object?> get props => [matchRoomId];
}

class MatchRoomEndPage extends ConsumerWidget {
  const MatchRoomEndPage._(this.args);
  final MatchRoomEndPageArgs args;

  static const routeName = '/match_room_end';

  static Route<void> route(MatchRoomEndPageArgs args) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => MatchRoomEndPage._(args),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(matchRoomResultProvider(args.matchRoomId));
    // TODO(tsuda): ユーザー名の取得
    const username = 'ユーザ名'; 
    final correct = result.result;
    final total = result.total;

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
