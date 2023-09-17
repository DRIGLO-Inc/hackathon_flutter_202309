import 'package:flutter/material.dart';

class ObscureTextSwitcherButton extends StatefulWidget {
  const ObscureTextSwitcherButton({
    super.key,
    required this.obscure,
    required this.onChanged,
  });

  factory ObscureTextSwitcherButton.valueNotifier(
    ValueNotifier<bool> valueNotifier,
  ) =>
      ObscureTextSwitcherButton(
        obscure: valueNotifier.value,
        onChanged: (value) {
          valueNotifier.value = value;
        },
      );

  final bool obscure;
  final ValueChanged<bool> onChanged;

  @override
  State<ObscureTextSwitcherButton> createState() =>
      _ObscureTextSwitcherButtonState();
}

class _ObscureTextSwitcherButtonState extends State<ObscureTextSwitcherButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onChanged(!widget.obscure);
      },
      icon: widget.obscure
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
