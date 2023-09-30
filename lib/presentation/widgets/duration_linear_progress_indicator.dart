import 'dart:async';

import 'package:flutter/material.dart';

class DurationLinearProgressIndicator extends StatefulWidget {
  const DurationLinearProgressIndicator({
    super.key,
    required this.duration,
    this.autoStart = true,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final Duration duration;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? minHeight;
  final String? semanticsLabel;
  final String? semanticsValue;
  final bool autoStart;

  @override
  DurationLinearProgressIndicatorState createState() =>
      DurationLinearProgressIndicatorState();
}

class DurationLinearProgressIndicatorState
    extends State<DurationLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  /// between `0.0` and `1.0`
  double get value => _animationController.value;

  /// between `0.0` and `1.0`
  void overrideValue(double Function(double currentValue) update) {
    _animationController.value = update(value);
  }

  void pause() {
    _animationController.stop();
  }

  Future<void> start() async {
    await _animationController.forward();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autoStart) {
        start();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: _animationController.value,
        backgroundColor: widget.backgroundColor,
        color: widget.color,
        valueColor: widget.valueColor,
        minHeight: widget.minHeight,
        semanticsLabel: widget.semanticsLabel,
        semanticsValue: widget.semanticsValue,
      ),
    );
  }
}
