import 'package:flutter/material.dart';

class AppColorScheme {
  const AppColorScheme._();

  static ColorScheme get light {
    const baseColorScheme = ColorScheme.light();

    return ColorScheme.fromSeed(
      seedColor: baseColorScheme.primary,
      secondary: baseColorScheme.secondary,
      error: baseColorScheme.error,
    );
  }

  static ColorScheme get dark {
    const baseColorScheme = ColorScheme.dark();

    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: baseColorScheme.primary,
      secondary: baseColorScheme.secondary,
      error: baseColorScheme.error,
    );
  }
}
