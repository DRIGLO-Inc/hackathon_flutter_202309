import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/shared_preferences/shared_preferences.dart';
import '../../infrastructure/shared_preferences/shared_preferences_key.dart';

final themeSwitcherNotifierProvider =
    NotifierProvider<ThemeSwitcherNotifier, ThemeMode>(
  ThemeSwitcherNotifier.new,
);

class ThemeSwitcherNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return _fetch();
  }

  void setValue(ThemeMode value) {
    state = value;
    _save(value);
  }

  void reset() {
    state = ThemeMode.system;
    _save(ThemeMode.system);
  }

  Future<void> _save(ThemeMode value) async {
    await ref
        .read(sharedPreferencesProvider)
        .write(key: SharedPreferencesKey.themeMode, value: _toJson(value));
  }

  ThemeMode _fetch() {
    return _fromJson(
      ref
          .read(sharedPreferencesProvider)
          .read<String>(SharedPreferencesKey.themeMode),
    );
  }

  String _toJson(ThemeMode themeMode) => themeMode.name;
  ThemeMode _fromJson(String? json) {
    if (json == ThemeMode.system.name) {
      return ThemeMode.system;
    }

    if (json == ThemeMode.light.name) {
      return ThemeMode.light;
    }

    if (json == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }

    return ThemeMode.system;
  }
}
