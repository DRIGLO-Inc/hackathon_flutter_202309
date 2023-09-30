import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../main/widgets/select_room_card_list.dart';

const _kMatchRoomEnterCardHeight = 126.0;

class MatchRoomEnterCardList extends ConsumerWidget {
  const MatchRoomEnterCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    return SliverList.separated(
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, index) {
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
              //TODO(Tani1015): ルームに入室
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '５人が待機中！参加してみよう！',
                      style: customTextTheme.body3.w6.copyWith(
                        color: CustomColors.grayShade0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (final userIndex in mockUser) ...[
                          if (userIndex != 0) const SizedBox(width: 8),
                          if (userIndex <= 3) Assets.images.svg.userIcon.svg(),
                          if (userIndex >= 4)
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
  }
}
