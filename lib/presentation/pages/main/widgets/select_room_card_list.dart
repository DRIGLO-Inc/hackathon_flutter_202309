import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room/use_cases/match_room_list.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../match_room_start/match_room_start_page.dart';

const _kSelectRoomHeight = 216.0;
const _kSelectRoomWidth = 240.0;

const mockUser = [1, 2, 3, 4];

class SelectRoomCardList extends ConsumerWidget {
  const SelectRoomCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchRoomListAsync = ref.watch(matchRoomListProvider);

    final borderRadius = BorderRadius.circular(20);

    return SizedBox(
      height: _kSelectRoomHeight,
      child: matchRoomListAsync.when(
        data: (beforeReverseMatchRoomList) {
          final matchRoomList = beforeReverseMatchRoomList.reversed.toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: matchRoomList.length,
            itemBuilder: (_, index) {
              final cardMargin = EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: 16,
              );

              final matchRoom = matchRoomList[index];

              return Container(
                margin: cardMargin,
                width: _kSelectRoomWidth,
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
                    onTap: () {
                      final matchRoom = matchRoomList[index];
                      Navigator.of(context).push(
                        MatchRoomStartPage.route(
                          MatchRoomStartPageArgs(
                            matchRoom: matchRoom,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 64,
                                child: Text(
                                  matchRoom.invitationId,
                                  style: customTextTheme.header5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '${matchRoom.invitationId.length}人が待機中',
                                style: customTextTheme.body3.w6.copyWith(
                                  color: CustomColors.grayShade0,
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var userIndex = 0;
                                userIndex < matchRoom.invitationId.length;
                                userIndex++) ...[
                              if (userIndex != 0) const SizedBox(width: 8),
                              if (userIndex < 3)
                                Assets.images.svg.userIcon.svg(),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (_, __) => const Center(child: Text('エラーが発生しました')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
