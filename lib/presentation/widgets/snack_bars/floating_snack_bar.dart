import 'package:flutter/material.dart';

class FloatingSnackBar extends SnackBar {
  FloatingSnackBar({
    super.key,
    required this.message,
    super.backgroundColor,
  }) : super(behavior: SnackBarBehavior.floating, content: Text(message));

  final String message;

  static void showSuccess(
    BuildContext context, {
    required String message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      FloatingSnackBar(
        message: message,
        backgroundColor: colorScheme.primary,
      ),
    );
  }
  static void showError(
    BuildContext context, {
    required String message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      FloatingSnackBar(
        message: message,
        backgroundColor: colorScheme.error,
      ),
    );
  }
}
