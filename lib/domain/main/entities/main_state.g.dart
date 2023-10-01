// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MainState _$$_MainStateFromJson(Map<String, dynamic> json) => _$_MainState(
      enableEnterMatchRooms:
          (json['enable_enter_match_rooms'] as List<dynamic>?)
                  ?.map((e) => MatchRoom.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MainStateToJson(_$_MainState instance) =>
    <String, dynamic>{
      'enable_enter_match_rooms': instance.enableEnterMatchRooms,
      'genres': instance.genres,
    };
