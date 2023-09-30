import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/color/custom_colors.dart';

class TimerCounter extends ConsumerWidget {
  const TimerCounter({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // TODO(Tani1015): 残り時間3秒で赤に変更する
            color: Colors.blueAccent.withOpacity(0.7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
