import 'package:adaptive_dialog/adaptive_dialog.dart' as adaptive_dialog;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/routes/dialog_route_settings.dart';

class PlatformAdaptiveAlertDialogAction<T>
    extends adaptive_dialog.AlertDialogAction<T> {
  const PlatformAdaptiveAlertDialogAction({
    required super.key,
    required super.label,
    super.isDefaultAction,
    super.isDestructiveAction,
  });
}

class PlatformAdaptiveAlertDialogCustomAction<T> {
  const PlatformAdaptiveAlertDialogCustomAction({
    required this.onPressed,
    required this.label,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  CupertinoDialogAction convertToIOSDialogAction() {
    return CupertinoDialogAction(
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Widget convertToMaterialDialogAction({
    required Color primaryColor,
    required Color destructiveColor,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isDestructiveAction ? destructiveColor : primaryColor,
        ),
      ),
    );
  }
}

class PlatformAdaptiveDialog {
  const PlatformAdaptiveDialog._();

  static Future<void> showOkDialog({
    required BuildContext context,
    required String title,
    String? message,
    String? okLabel,
    bool barrierDismissible = true,
  }) {
    return adaptive_dialog.showOkAlertDialog(
      context: context,
      title: title,
      message: message,
      okLabel: okLabel,
      barrierDismissible: barrierDismissible,
      routeSettings: const RouteSettings(name: kDialogRouteName),
      builder: _builder,
    );
  }

  /// return `true`, if ok Tap.
  static Future<bool> showOkCancelDialog({
    required BuildContext context,
    required String title,
    String? message,
    String? okLabel,
    String? cancelLabel,
    bool barrierDismissible = true,
  }) async {
    final result = await adaptive_dialog.showOkCancelAlertDialog(
      context: context,
      title: title,
      message: message,
      okLabel: okLabel,
      cancelLabel: cancelLabel,
      barrierDismissible: barrierDismissible,
      routeSettings: const RouteSettings(name: kDialogRouteName),
      builder: _builder,
    );

    return result == adaptive_dialog.OkCancelResult.ok;
  }

  static Future<T?> showModalActionSheet<T>({
    required BuildContext context,
    required Map<T, String> labels,
  }) {
    return adaptive_dialog.showModalActionSheet<T>(
      context: context,
      routeSettings: const RouteSettings(name: kDialogRouteName),
      actions: labels.entries
          .map(
            (entry) => adaptive_dialog.SheetAction<T>(
              label: entry.value,
              key: entry.key,
            ),
          )
          .toList(),
      builder: _builder,
    );
  }

  static Future<T?> showAlertDialog<T>({
    required BuildContext context,
    List<PlatformAdaptiveAlertDialogAction<T>> actions = const [],
    String? title,
    String? message,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
  }) {
    const routeSettings = RouteSettings(name: kDialogRouteName);
    final theme = Theme.of(context);
    final effectiveStyle = adaptive_dialog.AdaptiveDialog.instance.defaultStyle
        .effectiveStyle(theme);

    switch (effectiveStyle) {
      case adaptive_dialog.AdaptiveStyle.iOS:
      case adaptive_dialog.AdaptiveStyle.macOS:
      // ignore: deprecated_member_use
      case adaptive_dialog.AdaptiveStyle.cupertino:
        // NOTE: デフォルトの adaptive_dialog では、iOS の barrierDismissible が設定できないので、
        // adaptive_dialog からトレースして設定できるようにした
        return showCupertinoDialog(
          context: context,
          useRootNavigator: useRootNavigator,
          routeSettings: routeSettings,
          barrierDismissible: barrierDismissible,
          builder: (context) {
            final dialog = CupertinoAlertDialog(
              title: title != null ? Text(title) : null,
              content: message != null ? Text(message) : null,
              actions: actions
                  .map(
                    (a) => a.convertToIOSDialogAction(
                      onPressed: Navigator.of(context).pop,
                    ),
                  )
                  .toList(),
            );
            return _builder(context, dialog);
          },
        );
      case adaptive_dialog.AdaptiveStyle.adaptive:
      case adaptive_dialog.AdaptiveStyle.material:
        return adaptive_dialog.showAlertDialog<T>(
          context: context,
          routeSettings: routeSettings,
          title: title,
          actions: actions,
          builder: _builder,
        );
    }
  }

  static Future<void> showCustomActionDialog<T>({
    required BuildContext context,
    List<PlatformAdaptiveAlertDialogCustomAction<T>> actions = const [],
    String? title,
    String? message,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
    Future<bool> Function()? onWillPop,
  }) {
    const routeSettings = RouteSettings(name: kDialogRouteName);
    final theme = Theme.of(context);
    final effectiveStyle = adaptive_dialog.AdaptiveDialog.instance.defaultStyle
        .effectiveStyle(theme);

    final titleText = title != null ? Text(title) : null;
    final contentText = message != null ? Text(message) : null;

    switch (effectiveStyle) {
      case adaptive_dialog.AdaptiveStyle.iOS:
      case adaptive_dialog.AdaptiveStyle.macOS:
      // ignore: deprecated_member_use
      case adaptive_dialog.AdaptiveStyle.cupertino:
        // NOTE: デフォルトの adaptive_dialog では、iOS の barrierDismissible が設定できないので、
        // adaptive_dialog からトレースして設定できるようにした
        return showCupertinoDialog(
          context: context,
          useRootNavigator: useRootNavigator,
          routeSettings: routeSettings,
          barrierDismissible: barrierDismissible,
          builder: (context) {
            final dialog = CupertinoAlertDialog(
              title: titleText,
              content: contentText,
              actions: actions
                  .map(
                    (a) => a.convertToIOSDialogAction(),
                  )
                  .toList(),
            );
            return _builder(context, dialog);
          },
        );
      case adaptive_dialog.AdaptiveStyle.adaptive:
      case adaptive_dialog.AdaptiveStyle.material:
        return showDialog(
          context: context,
          useRootNavigator: useRootNavigator,
          routeSettings: routeSettings,
          builder: (context) {
            final dialog = WillPopScope(
              onWillPop: onWillPop,
              child: AlertDialog(
                title: titleText,
                content: contentText,
                actions: actions
                    .map(
                      (a) => a.convertToMaterialDialogAction(
                        destructiveColor: theme.colorScheme.error,
                        primaryColor: theme.colorScheme.primary,
                      ),
                    )
                    .toList(),
                scrollable: true,
              ),
            );

            return _builder(context, dialog);
          },
        );
    }
  }

  /// Cupertino のダイアログを、青色にする
  static Widget _builder(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    final platform = theme.platform;

    final isCupertino =
        [TargetPlatform.iOS, TargetPlatform.macOS].contains(platform);
    final isMaterial = [TargetPlatform.android].contains(platform);

    final effectiveColorScheme = isCupertino
        ? theme.colorScheme.copyWith(
            primary: const Color(0xFF007AFF),
          )
        : theme.colorScheme;

    final effectiveTextButtonThemeData = isMaterial
        ? TextButtonThemeData(
            style:
                (theme.textButtonTheme.style ?? const ButtonStyle()).copyWith(
              foregroundColor:
                  MaterialStatePropertyAll(theme.colorScheme.primary),
              textStyle: const MaterialStatePropertyAll(
                TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        : theme.textButtonTheme;

    return Theme(
      data: theme.copyWith(
        colorScheme: effectiveColorScheme,
        textButtonTheme: effectiveTextButtonThemeData,
      ),
      child: child,
    );
  }
}
