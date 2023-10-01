// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../genre/entities/genre.dart';
import '../../match_room/entities/match_room.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<MatchRoom> enableEnterMatchRooms,
    // TODO(Tani1015): ジャンル取得ではなくジャンルをクエリで問題を取得する。
    @Default([]) List<Genre> genres,
  }) = _MainState;

  const MainState._();
  factory MainState.fromJson(Map<String, Object?> json) =>
      _$MainStateFromJson(json);
}
