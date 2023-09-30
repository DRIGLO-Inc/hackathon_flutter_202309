import 'package:flutter/material.dart';

class PrimaryShaderMask extends StatelessWidget {
  const PrimaryShaderMask({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF69D4C1),
            Color(0xFF7FB0EA),
          ],
        ),
      ),
      child: child,
    );
  }
}
