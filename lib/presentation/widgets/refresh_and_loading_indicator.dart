import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefreshAndLoadingIndicator extends StatefulWidget {
  const RefreshAndLoadingIndicator({
    super.key,
    required this.child,
    this.onRefresh,
    this.onLoading,
  });

  /// スクロール要素を持つウィジェット
  final Widget child;

  /// プルダウンによる再取得処理
  final Future<void> Function()? onRefresh;

  /// プルアップによる追加取得処理
  final Future<void> Function()? onLoading;

  @override
  State<RefreshAndLoadingIndicator> createState() =>
      _RefreshAndLoadingIndicatorState();
}

class _RefreshAndLoadingIndicatorState
    extends State<RefreshAndLoadingIndicator> {
  final RefreshController refreshController = RefreshController();

  bool get enablePullDown => widget.onRefresh != null;
  bool get enablePullUp => widget.onLoading != null;

  Future<void> onRefresh() async {
    await widget.onRefresh!();
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    await widget.onLoading!();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: const _RefreshCustomHeader(),
      footer: const _LoadingCustomFooter(),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: enablePullDown ? onRefresh : null,
      onLoading: enablePullUp ? onLoading : null,
      controller: refreshController,
      child: widget.child,
    );
  }
}

/// プルダウンでリストのトップに表示されるインジケータ
class _RefreshCustomHeader extends StatelessWidget {
  const _RefreshCustomHeader();

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      height: 72,
      builder: (context, mode) {
        return const Center(
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        );
      },
    );
  }
}

/// プルアップでリストのボトムに表示されるインジケータ
class _LoadingCustomFooter extends StatelessWidget {
  const _LoadingCustomFooter();

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 72,
      builder: (context, mode) {
        return const Center(
          child: SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        );
      },
    );
  }
}
