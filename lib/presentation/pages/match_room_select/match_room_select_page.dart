import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/genre/entities/genre.dart';
import '../../../domain/match_room/entities/match_room.dart';
import '../../../utils/extensions/build_context_ex.dart';
import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/typography/typography.dart';
import '../../widgets/forms/search_text_field.dart';
import '../../widgets/unfocus_gesture_detector.dart';
import 'widgets/match_room_create_card.dart';
import 'widgets/match_room_enter_card_list.dart';

class MatchRoomSelectPageArgs extends Equatable {
  const MatchRoomSelectPageArgs({
    required this.enableEnterMatchRooms,
    required this.selectedGenre,
  });

  final List<MatchRoom> enableEnterMatchRooms;
  final Genre selectedGenre;

  @override
  List<Object?> get props => [enableEnterMatchRooms, selectedGenre];
}

class MatchRoomSelectPage extends ConsumerWidget {
  const MatchRoomSelectPage._();

  static const routeName = '/match_room_select';

  static Route<void> route({required MatchRoomSelectPageArgs args}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => const MatchRoomSelectPage._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = context.pageArgs<MatchRoomSelectPageArgs>();

    return UnfocusGestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.selectedGenre.genreName,
            style: customTextTheme.body5.w6,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: SliverMatchRoomCreateCard(),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: SearchTextField(hintText: 'テストジャンルまたはIDを入力'),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'すぐ入室可能なテストルーム',
                    style: customTextTheme.body5.w6,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                16,
                0,
                16,
                MediaQuery.paddingOf(context).bottom + 16,
              ),
              sliver: MatchRoomEnterCardList(
                enableEnterRoomList: args.enableEnterMatchRooms,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
