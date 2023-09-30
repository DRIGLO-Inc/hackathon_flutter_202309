import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/assets.gen.dart';

class SliverHeaderImage extends ConsumerWidget {
  const SliverHeaderImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      delegate: _CustomSliverHeaderDelegate(
        maxHeight: 240,
        minHeight: 240,
        child: Assets.images.png.mainHeaderImage.image(
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CustomSliverHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  final double maxHeight;
  final double minHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_CustomSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
