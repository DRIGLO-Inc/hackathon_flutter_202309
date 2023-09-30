import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';

const _kSelectRoomHeight = 216.0;
const _kSelectRoomWidth = 240.0;

const mockUser = [1, 2, 3, 4];

class SelectRoomCardList extends ConsumerWidget {
  const SelectRoomCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderRadius = BorderRadius.circular(20);

    return SizedBox(
      height: _kSelectRoomHeight,
      // TODO(Tani1015): ルームがない時にテキストを表示する
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) {
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
                              'テストテストテストテストテストジャンル名',
                              style: customTextTheme.header5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '⚪︎人が待機中',
                            style: customTextTheme.body3.w6.copyWith(
                              color: CustomColors.grayShade0,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    // TODO(Tani1015): 人数分表示する
                    Row(
                      children: [
                        for (final userIndex in mockUser) ...[
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
