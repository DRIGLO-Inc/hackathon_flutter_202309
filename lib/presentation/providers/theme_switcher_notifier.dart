import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSwitcherNotifierProvider =
    NotifierProvider<ThemeSwitcherNotifier, ThemeMode>(
  ThemeSwitcherNotifier.new,
);

class ThemeSwitcherNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void setValue(ThemeMode value) {
    state = value;
  }
}
