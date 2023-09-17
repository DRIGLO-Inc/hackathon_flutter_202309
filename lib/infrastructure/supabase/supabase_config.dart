import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../flavor.dart';
import '../../utils/logger.dart';

class SupabaseConfig {
  factory SupabaseConfig._dev() {
    return const SupabaseConfig._(
      debug: true,
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

  const SupabaseConfig._({
    required this.url,
    required this.anonKey,
    required this.debug,
  });

  static late final SupabaseConfig instance;

  final String url;
  final String anonKey;
  final bool debug;

  static Future<void> init() async {
    final config = switch (flavor) {
      Flavor.dev => SupabaseConfig._dev(),
      Flavor.prod => SupabaseConfig._prod(),
    };

    instance = config;

    await Supabase.initialize(
      url: config.url,
      anonKey: config.anonKey,
      debug: config.debug,
    );
  }

  FutureOr<T> run<T>(
    FutureOr<T> Function(SupabaseClient client) runner,
  ) async {
    try {
      return await runner(Supabase.instance.client);
    } on Exception catch (e, s) {
      logger.error(e, s);
      rethrow;
    }
  }

  T runSync<T>(T Function(SupabaseClient client) runner) {
    try {
     return runner(Supabase.instance.client);
    } on Exception catch (e, s) {
      logger.error(e, s);
      rethrow;
    }
  }
}
