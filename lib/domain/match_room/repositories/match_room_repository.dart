import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/match_room.dart';

final matchRoomRepository = riverpod.Provider.autoDispose<MatchRoomRepository>(
  (ref) => MatchRoomRepository(SupabaseConfig.instance),
);

class MatchRoomRepository {
  MatchRoomRepository(this._supabaseConfig);

  final SupabaseConfig _supabaseConfig;

  Future<MatchRoom> create(MatchRoom data) async {
    return _supabaseConfig.run(
      (client) => client
          .from(SupabaseTables.matchRooms)
          .insert(data.toJson())
          .select<PostgrestList>()
          .then((value) => MatchRoom.fromJson(value.first)),
    );
  }

  Stream<MatchRoom> watch(String id) => _supabaseConfig.runSync(
        (client) => client
            .from(SupabaseTables.matchRooms)
            .stream(primaryKey: ['match_room_id'])
            .eq('match_room_id', id)
            .asyncMap(
              (event) {
                return MatchRoom.fromJson(event.first);
              },
            ),
      );

  Stream<List<MatchRoom>> list() => _supabaseConfig.runSync(
        (client) => client
            .from(SupabaseTables.matchRooms)
            .stream(primaryKey: ['match_room_id'])
            .asyncMap(
              (event) {
                return event.map(MatchRoom.fromJson).toList();
              },
            ),
      );

  Future<void> start(String id) => _supabaseConfig.runSync(
        (client) => client.from(SupabaseTables.matchRooms).update({
          'is_start': true,
        }).eq('match_room_id', id),
      );
}
