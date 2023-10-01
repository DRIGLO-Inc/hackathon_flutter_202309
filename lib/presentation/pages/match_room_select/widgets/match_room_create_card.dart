import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room/use_cases/match_room_create.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../match_room_start/match_room_start_page.dart';

class SliverMatchRoomCreateCard extends ConsumerWidget {
  const SliverMatchRoomCreateCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        color: CustomColors.primaryMain,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ルームをつくる',
                style: customTextTheme.header4.copyWith(
                  color: CustomColors.grayShade0,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '入りたいルームがない場合はこちら\n1人でテストしてもOK、友達を誘うこともできます！',
              ),
              // TODO(tsuda): ジャンル名を表示
              Text.rich(
                const TextSpan(
                  children: [
                    TextSpan(text: 'ジャンル名を表示'),
                  ],
                ),
                style: customTextTheme.body5.w6,
              ),
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      backgroundColor: CustomColors.grayShade0,
                      foregroundColor: CustomColors.grayShade1000,
                    ),
                    onPressed: () async {
                      final matchRoom =
                          await ref.read(matchRoomCreateProvider)();
                      if (context.mounted) {
                        await Navigator.of(context).push(
                          MatchRoomStartPage.route(
                            MatchRoomStartPageArgs(
                              matchRoom: matchRoom,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'はじめる',
                          style: customTextTheme.body5.w6,
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
