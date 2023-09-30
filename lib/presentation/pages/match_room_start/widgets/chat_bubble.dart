import 'package:flutter/material.dart';

import '../../../theme/color/custom_colors.dart';
import '../../../theme/typography/typography.dart';

enum ChatBubbleDecoration { outlined, filledPrimary, filledGray }

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.text,
    required this.decoration,
  });

  final String text;
  final ChatBubbleDecoration decoration;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final Color foregroundColor;
    final BorderSide borderSide;

    switch (decoration) {
      case ChatBubbleDecoration.outlined:
        backgroundColor = CustomColors.grayShade0;
        foregroundColor = CustomColors.grayShade700;
        borderSide = const BorderSide(
          color: CustomColors.primaryMain,
          width: 2,
        );
      case ChatBubbleDecoration.filledPrimary:
        backgroundColor = CustomColors.primaryMain;
        foregroundColor = CustomColors.grayShade0;
        borderSide = BorderSide.none;
      case ChatBubbleDecoration.filledGray:
        backgroundColor = CustomColors.grayShade300;
        foregroundColor = CustomColors.grayShade0;
        borderSide = BorderSide.none;
    }

    return IntrinsicWidth(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: borderSide,
            borderRadius: BorderRadius.circular(16),
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Center(
            child: Text(
              text,
              overflow: TextOverflow.visible,
              style: customTextTheme.body3.copyWith(
                color: foregroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
