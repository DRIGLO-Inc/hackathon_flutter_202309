import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../constants/dialog_route_settings.dart';
import '../../theme/color/custom_colors.dart';

class OkDialogArgs extends Equatable {
  const OkDialogArgs({
    required this.title,
    required this.content,
    required this.okLabel,
  });

  final String title;
  final String content;
  final String okLabel;

  @override
  List<Object?> get props => [title];
}

class OkDialog extends StatelessWidget {
  const OkDialog._(this.args);
  final OkDialogArgs args;

  static Future<bool?> show(
    BuildContext context, {
    bool barrierDismissible = true,
    required OkDialogArgs args,
  }) {
    return showDialog<bool>(
      routeSettings: RouteSettings(name: kDialogRouteName, arguments: args),
      barrierDismissible: barrierDismissible,
      useRootNavigator: false,
      context: context,
      builder: (_) => OkDialog._(args),
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
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: CustomColors.grayShade700,
          ),
          child: Text(args.okLabel),
        ),
      ],
    );
  }
}
