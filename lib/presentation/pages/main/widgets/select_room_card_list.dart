import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room/entities/match_room.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';

const _kSelectRoomHeight = 216.0;
const _kSelectRoomWidth = 240.0;

const mockUser = [1, 2, 3, 4];

class SelectRoomCardList extends ConsumerWidget {
  const SelectRoomCardList({super.key, required this.enableEnterRoomList});

  final List<MatchRoom> enableEnterRoomList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    return SizedBox(
      height: _kSelectRoomHeight,
      // TODO(Tani1015): ルームがない時にテキストを表示する
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: enableEnterRoomList.length,
        itemBuilder: (_, index) {
          final enableMatchRoom = enableEnterRoomList[index];

          final cardMargin = EdgeInsets.only(
            left: index == 0 ? 16 : 0,
            right: 16,
          );

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
                // TODO(Tani1015): ルームに入室
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 64,
                            child: Text(
                              enableMatchRoom.matchRoomId,
                              style: customTextTheme.header5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${enableMatchRoom.invitationId.length}人が待機中',
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
                            userIndex <
                                enableEnterRoomList[index].invitationId.length;
                            userIndex++) ...[
                          if (userIndex != 0) const SizedBox(width: 8),
                          if (userIndex <= 4) Assets.images.svg.userIcon.svg(),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
