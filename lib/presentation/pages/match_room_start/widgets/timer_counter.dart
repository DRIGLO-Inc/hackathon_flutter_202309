import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/match_room_chat/use_cases/match_room_chat_count.dart';
import '../../../../utils/extensions/text_style_ex.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';
import '../../../widgets/duration_linear_progress_indicator.dart';

class TimerCounter extends ConsumerStatefulWidget {
  const TimerCounter({super.key});

  @override
  ConsumerState<TimerCounter> createState() => _TimerCounterState();
}

class _TimerCounterState extends ConsumerState<TimerCounter> {
  final _durationLinearProgressIndicatorKey =
      GlobalKey<DurationLinearProgressIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final count =
        MatchRoomChatCount.maxCount - ref.watch(matchRoomCountProvider);

    ref.listen<int>(
      matchRoomCountProvider,
      (_, next) {
        if (next == 0) {
          _durationLinearProgressIndicatorKey.currentState!
            ..overrideValue((_) => 0)
            ..start();
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: DurationLinearProgressIndicator(
              key: _durationLinearProgressIndicatorKey,
              duration: const Duration(seconds: MatchRoomChatCount.maxCount),
              minHeight: 8,
              color: CustomColors.secondaryYellow,
              backgroundColor: CustomColors.grayShade500,
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
                  count.toString(),
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
