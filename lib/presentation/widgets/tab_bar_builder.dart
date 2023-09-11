import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

const double _kIndicatorWidth = 2;

class TabBarBuilder extends StatefulWidget {
  const TabBarBuilder({
    super.key,
    required this.tabs,
    required this.pages,
    this.header,
    this.nestedScrollController,
    this.onTabChanged,
    this.tabBarBackgroundColor,
  });

  final Widget? header;
  final List<Widget> tabs;
  final List<Widget> pages;
  final ScrollController? nestedScrollController;
  final ValueChanged<int>? onTabChanged;
  final Color? tabBarBackgroundColor;

  @override
  State<TabBarBuilder> createState() => _TabBarBuilderState();
}

class _TabBarBuilderState extends State<TabBarBuilder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: ExtendedNestedScrollView(
        controller: widget.nestedScrollController,
        onlyOneScrollInBody: true,
        pinnedHeaderSliverHeightBuilder: () {
          return kToolbarHeight + MediaQuery.of(context).padding.top;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            if (widget.header != null) widget.header!,
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                TabBar(
                  tabs: widget.tabs
                      .map((child) => Tab(height: 52, child: child))
                      .toList(),
                  onTap: widget.onTabChanged,
                ),
                backgroundColor: widget.tabBarBackgroundColor,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: widget.pages,
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar, {this.backgroundColor});

  final TabBar tabBar;
  final Color? backgroundColor;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final tabBarTheme = theme.tabBarTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: tabBarTheme.dividerColor ?? theme.dividerColor,
            width: _kIndicatorWidth,
          ),
        ),
      ),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
