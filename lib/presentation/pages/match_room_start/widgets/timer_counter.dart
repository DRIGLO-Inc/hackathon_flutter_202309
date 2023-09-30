import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';

class TimerCounter extends ConsumerWidget {
  const TimerCounter({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(
            child: LinearProgressIndicator(
              // TODO(Tani1015): counterの値を使って、残り時間を表現する
              value: 0.3,
              minHeight: 8,
              color: CustomColors.secondaryYellow,
              backgroundColor: CustomColors.grayShade500,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
          const SizedBox(width: 12),
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.secondaryYellow,
            ),
            child: SizedBox.square(
              dimension: 48,
              child: Center(
                child: Text(
                  counter.toString(),
                  style: customTextTheme.caption2.w6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
