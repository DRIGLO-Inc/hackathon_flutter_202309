import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/logger.dart';
import 'shared_preferences_key.dart';

final sharedPreferencesProvider =
    Provider.autoDispose<SharedPreferencesInfrastructure>(
  (_) => throw UnimplementedError(),
);

class SharedPreferencesInfrastructure {
  SharedPreferencesInfrastructure(this._prefs);

  final SharedPreferences _prefs;

  static Future<SharedPreferencesInfrastructure> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferencesInfrastructure(prefs);
  }

  T? read<T>(SharedPreferencesKey key) {
    try {
      final value = _prefs.get(key.keyName) as T?;

      logger.config('shared preferences [read]\n key: $key, value: $value');

      return value;
    } on Exception catch (e) {
      logger.error(e);

      rethrow;
    }
  }

  Future<void> write<T>({
    required SharedPreferencesKey key,
    required T value,
  }) async {
    try {
      if (value is String) {
        await _prefs.setString(key.keyName, value);
      } else if (value is int) {
        await _prefs.setInt(key.keyName, value);
      } else if (value is double) {
        await _prefs.setDouble(key.keyName, value);
      } else if (value is List<String>) {
        await _prefs.setStringList(key.keyName, value);
      } else if (value is bool) {
        await _prefs.setBool(key.keyName, value);
      } else {
        throw UnsupportedError(
          '$T はサポートされていない型です。args: {key: $key, value: $value}',
        );
      }

      logger.config('shared preferences [write]\n key: $key, value: $value');
    } on Exception catch (e) {
      logger.error(e);

      rethrow;
    }
  }

  Future<void> delete({
    required SharedPreferencesKey key,
  }) async {
    try {
      await _prefs.remove(key.keyName);
    } on Exception catch (e) {
      logger.error(e);

      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await _prefs.clear();
    } on Exception catch (e) {
      logger.error(e);

      rethrow;
    }
  }
}
