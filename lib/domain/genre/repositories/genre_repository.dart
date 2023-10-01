import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../infrastructure/supabase/supabase_config.dart';
import '../../../infrastructure/supabase/supabase_tables.dart';
import '../entities/genre.dart';

final genreRepository = riverpod.Provider.autoDispose<GenreRepository>(
  (ref) => GenreRepository(SupabaseConfig.instance),
);

class GenreRepository {
  GenreRepository(this._supabaseConfig);

  final SupabaseConfig _supabaseConfig;

  Future<List<Genre>> fetch({Genre? genre}) async {
    return _supabaseConfig.run((client) {
      if (genre != null) {
        return client
            .from(SupabaseTables.genres)
            .select<PostgrestList>()
            .eq('genre_id', genre.genreId)
            .then((values) => values.map(Genre.fromJson).toList());
      }
      return client
          .from(SupabaseTables.genres)
          .select<PostgrestList>()
          .then((values) => values.map(Genre.fromJson).toList());
    });
  }
}
