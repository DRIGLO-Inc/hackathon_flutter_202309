import 'package:flutter/material.dart';

import '../../utils/extensions/build_context_ex.dart';

class UnfocusGestureDetector extends StatelessWidget {
  const UnfocusGestureDetector({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unfocus();
      },
      child: child,
    );
  }
}
