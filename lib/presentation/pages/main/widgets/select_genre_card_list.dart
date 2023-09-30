import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../match_room_select/match_room_select_page.dart';

const _kSelectGenreCardWidth = 160.0;
const _kSelectGenreCardHeight = 116.0;
const _kSelectGenreCardSpacing = 16.0;

class SelectGenreCardList extends ConsumerWidget {
  const SelectGenreCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: _kSelectGenreCardSpacing,
        crossAxisSpacing: _kSelectGenreCardSpacing,
        mainAxisExtent: _kSelectGenreCardHeight,
      ),
      itemBuilder: (_, index) => SizedBox(
        width: _kSelectGenreCardWidth,
        child: Card(
          color: CustomColors.grayShade0,
          surfaceTintColor: Colors.transparent,
          elevation: 4,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          child: InkWell(
            borderRadius: borderRadius,
            //TODO(Tani1015): ジャンル画面に遷移する
            onTap: () => Navigator.of(context).push(
              MatchRoomSelectPage.route(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    child: Text(
                      'ドリグロ検定ドリグロ検定ドリグロ検定',
                      style: customTextTheme.body5.w6,
                    ),
                  ),
                  Text(
                    '登録問題 : ⚪︎問',
                    style: customTextTheme.caption1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
