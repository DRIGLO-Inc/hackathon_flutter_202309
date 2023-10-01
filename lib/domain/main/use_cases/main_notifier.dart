import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../genre/entities/genre.dart';
import '../../match_room/entities/match_room.dart';
import '../entities/main_state.dart';

const mockQuestionGenreLength = [
  10,
  10,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
  100,
];

final mainNotifierProvider =
    AsyncNotifierProvider.autoDispose<MainNotifier, MainState>(
  MainNotifier.new,
);

class MainNotifier extends AutoDisposeAsyncNotifier<MainState> {
  List<MatchRoom> _fetchedMatchRoomList = [];
  List<Genre> _fetchGenreList = [];

  @override
  FutureOr<MainState> build() {
    // TODO(Tani1015): 入室可能な部屋とジャンルを取得する
    _fetchedMatchRoomList = [
      for (var i = 0; i < 2; i++)
        MatchRoom(
          matchRoomId: '$i',
          ownerId: '$i',
          invitationId: '$i',
          isStart: false,
        ),
    ];

    _fetchGenreList = [
      for (var i = 1; i < 12; i++)
        Genre(
          genreId: '$i',
          genreName: 'ジャンル$i',
        ),
    ];

    if (_fetchedMatchRoomList.isEmpty) {
      return const MainState();
    }

    return MainState(
      enableEnterMatchRooms: _fetchedMatchRoomList,
      genres: _fetchGenreList,
    );
  }
}
