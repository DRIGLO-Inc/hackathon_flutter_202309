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
      snackBarTheme: const SnackBarThemeData(
        showCloseIcon: true,
      ),
    );
  }

  static ThemeData get light {
    return _base(colorScheme: const ColorScheme.light());
  }

  static ThemeData get dark {
    return _base(colorScheme: const ColorScheme.dark());
  }
}
