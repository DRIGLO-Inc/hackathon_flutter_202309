import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../constants/dialog_route_settings.dart';
import '../../theme/color/custom_colors.dart';

class OkCancelDialogArgs extends Equatable {
  const OkCancelDialogArgs({
    required this.title,
    required this.content,
    required this.cancelLabel,
    required this.okLabel,
  });

  final String title;
  final String content;
  final String cancelLabel;
  final String okLabel;

  @override
  List<Object?> get props => [title];
}

class OkCancelDialog extends StatelessWidget {
  const OkCancelDialog._(this.args);
  final OkCancelDialogArgs args;

  static Future<bool?> show(
    BuildContext context, {
    bool barrierDismissible = true,
    required OkCancelDialogArgs args,
  }) {
    return showDialog<bool>(
      routeSettings: RouteSettings(name: kDialogRouteName, arguments: args),
      barrierDismissible: barrierDismissible,
      useRootNavigator: false,
      context: context,
      builder: (_) => OkCancelDialog._(args),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(args.title),
      content: Text(args.content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          style: TextButton.styleFrom(
            foregroundColor: CustomColors.grayShade700,
          ),
          child: Text(args.cancelLabel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          style: TextButton.styleFrom(
            foregroundColor: CustomColors.accentRed,
          ),
          child: Text(args.okLabel),
        ),
      ],
    );
  }
}
