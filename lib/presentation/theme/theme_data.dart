import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData _base({
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      // base
      useMaterial3: true,
      colorScheme: colorScheme,

      // scaffold
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),

      // input
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),

      // others
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
      ),
      snackBarTheme: const SnackBarThemeData(
        showCloseIcon: true,
      ),
      listTileTheme: ListTileThemeData(
        tileColor: colorScheme.primaryContainer,
        textColor: colorScheme.onPrimaryContainer,
      ),
    );
  }

  static ThemeData get light {
    const baseColorScheme = ColorScheme.light();

    return _base(
      colorScheme: ColorScheme.fromSeed(
        seedColor: baseColorScheme.primary,
        secondary: baseColorScheme.secondary,
        error: baseColorScheme.error,
      ),
    );
  }

  static ThemeData get dark {
    const baseColorScheme = ColorScheme.dark();

    return _base(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: baseColorScheme.primary,
        secondary: baseColorScheme.secondary,
        error: baseColorScheme.error,
      ),
    );
  }
}
