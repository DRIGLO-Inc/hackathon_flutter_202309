import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_switcher_notifier.dart';

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSwitcherNotifierProvider);
    final effectiveBrightness = switch (themeMode) {
      ThemeMode.system => MediaQuery.platformBrightnessOf(context),
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark
    };

    final Widget label;
    final Widget icon;

    switch (effectiveBrightness) {
      case Brightness.dark:
        label = const Text('ライトモード');
        icon = const Icon(Icons.light_mode);
      case Brightness.light:
        label = const Text('ダークモード');
        icon = const Icon(Icons.dark_mode);
    }

    return OutlinedButton.icon(
      onPressed: () {
        final value = switch (effectiveBrightness) {
          Brightness.dark => ThemeMode.light,
          Brightness.light => ThemeMode.dark
        };

        ref.read(themeSwitcherNotifierProvider.notifier).setValue(value);
      },
      icon: icon,
      label: label,
    );
  }
}
