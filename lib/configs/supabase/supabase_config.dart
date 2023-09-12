import 'package:supabase_flutter/supabase_flutter.dart';

import '../../flavor.dart';

class SupabaseConfig {
  factory SupabaseConfig._dev() {
    return const SupabaseConfig._(
      url: 'https://hxpshfapojdjaoszafwa.supabase.co',
      anonKey:
          // ignore: lines_longer_than_80_chars
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4cHNoZmFwb2pkamFvc3phZndhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQwNTEzNzcsImV4cCI6MjAwOTYyNzM3N30.QsGcFrvXYyIhyk5Sv3C-X4c4CcrsPH41JvQB4LYYHEg',
    );
  }

  factory SupabaseConfig._prod() {
    // TODO(tsuda): prod の設定追加
    throw UnimplementedError();
  }

  const SupabaseConfig._({required this.url, required this.anonKey});

  final String url;
  final String anonKey;

  static Future<void> init() async {
    final config = switch (flavor) {
      Flavor.dev => SupabaseConfig._dev(),
      Flavor.prod => SupabaseConfig._prod(),
    };

    await Supabase.initialize(
      url: config.url,
      anonKey: config.anonKey,
    );
  }
}
