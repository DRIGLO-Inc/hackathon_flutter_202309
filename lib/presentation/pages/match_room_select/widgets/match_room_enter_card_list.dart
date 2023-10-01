import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room/entities/match_room.dart';
import '../../../../domain/match_room/use_cases/match_room_list.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../match_room_start/match_room_start_page.dart';

const _kMatchRoomEnterCardHeight = 126.0;

class MatchRoomEnterCardList extends ConsumerWidget {
  const MatchRoomEnterCardList({super.key, required this.enableEnterRoomList});

  final List<MatchRoom> enableEnterRoomList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    final matchRoomListAsync = ref.watch(matchRoomListProvider);

    return matchRoomListAsync.when(
      data: (matchRoomList) {
        return SliverList.separated(
          itemCount: matchRoomList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final enableEnterMatchRoom = matchRoomList[index];
            return SizedBox(
              height: _kMatchRoomEnterCardHeight,
              child: Card(
                color: CustomColors.secondaryBlue,
                surfaceTintColor: Colors.transparent,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                ),
                child: InkWell(
                  borderRadius: borderRadius,
                  splashColor: CustomColors.accentBlue,
                  // TODO(Tani1015): ルームに入室
                  onTap: () {
                    Navigator.of(context).push(
                      MatchRoomStartPage.route(
                        MatchRoomStartPageArgs(
                          matchRoom: enableEnterMatchRoom,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          // ignore: lines_longer_than_80_chars
                          '${enableEnterMatchRoom.invitationId.length}人が待機中！参加してみよう！',
                          style: customTextTheme.body3.w6.copyWith(
                            color: CustomColors.grayShade0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (var userIndex = 0;
                                userIndex <
                                    enableEnterMatchRoom.invitationId.length;
                                userIndex++) ...[
                              if (userIndex != 0) const SizedBox(width: 8),
                              if (userIndex < 3)
                                Assets.images.svg.userIcon.svg(),
                              if (userIndex == 4)
                                Column(
                                  children: [
                                    Text(
                                      '+more',
                                      style: customTextTheme.caption2.w6,
                                    ),
                                  ],
                                ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (_, __) => const SliverToBoxAdapter(
        child: Text('エラー'),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
