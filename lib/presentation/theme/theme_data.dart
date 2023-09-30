import 'package:flutter/material.dart';

import 'color/color_scheme.dart';
import 'typography/font_family.dart';
import 'typography/typography.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData _base({
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      // base
      typography: typography,
      fontFamily: defaultFontFamily,
      useMaterial3: true,
      colorScheme: colorScheme,

      // scaffold
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),

      // dialog
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
      ),

      // input
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        border: InputBorder.none,
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
    return _base(colorScheme: AppColorScheme.light);
  }

  static ThemeData get dark {
    return _base(colorScheme: AppColorScheme.light);
  }
}
