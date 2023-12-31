import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';
import '../../../theme/color/custom_colors.dart';
import '../../../widgets/primary_shader_mask.dart';

class ChatAnswerAppBar extends PreferredSize {
  const ChatAnswerAppBar({
    super.key,
    required super.child,
  }) : super(preferredSize: const Size.fromHeight(kToolbarHeight + 28));

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.paddingOf(context);

    return MediaQuery.removePadding(
      context: context,
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: PrimaryShaderMask(
          child: Padding(
            padding: EdgeInsets.only(top: mediaPadding.top),
            child: NavigationToolbar(
              centerMiddle: false,
              middle: Row(
                children: [
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.edit_outlined,
                        color: CustomColors.primaryMain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        child,
                        const SizedBox(height: 4),
                        const Text(
                          '4人参加 全10問',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
