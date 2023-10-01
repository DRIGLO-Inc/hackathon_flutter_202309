import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/main/entities/main_state.dart';
import '../../../../domain/main/use_cases/main_notifier.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../match_room_select/match_room_select_page.dart';

const _kSelectGenreCardWidth = 160.0;
const _kSelectGenreCardHeight = 116.0;
const _kSelectGenreCardSpacing = 16.0;

class SelectGenreCardList extends ConsumerWidget {
  const SelectGenreCardList({super.key, required this.mainState});

  final MainState mainState;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    return SliverGrid.builder(
      itemCount: mainState.genres.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: _kSelectGenreCardSpacing,
        crossAxisSpacing: _kSelectGenreCardSpacing,
        mainAxisExtent: _kSelectGenreCardHeight,
      ),
      itemBuilder: (_, index) {
        final genre = mainState.genres[index];

        return SizedBox(
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
              // TODO(Tani1015): ジャンル画面に遷移する
              onTap: () => Navigator.of(context).push(
                MatchRoomSelectPage.route(
                  args: MatchRoomSelectPageArgs(
                    enableEnterMatchRooms: mainState.enableEnterMatchRooms,
                    selectedGenre: mainState.genres[index],
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        genre.genreName,
                        style: customTextTheme.body5.w6,
                      ),
                    ),
                    Text(
                      '登録問題 : ${mockQuestionGenreLength[index]}問',
                      style: customTextTheme.caption1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
