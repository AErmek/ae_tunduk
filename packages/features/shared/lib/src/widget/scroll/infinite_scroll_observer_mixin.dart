import 'package:flutter/material.dart';

mixin InfiniteScrollObserverMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController scrollController;

  double get loadExtent => 400;

  void onLoadMore();

  bool get canLoadMore;

  bool get isLoading;

  bool get _shouldLoad {
    if (!scrollController.hasClients) return false;

    final maxScroll = scrollController.position.maxScrollExtent;

    final currentScroll = scrollController.offset;

    final scrolledToBuffer = currentScroll >= (maxScroll - loadExtent);

    final contentNotFillingScreen = maxScroll < loadExtent;

    return scrolledToBuffer || contentNotFillingScreen;
  }

  void _onScroll() {
    _checkAndLoadMore();
  }

  void _checkAndLoadMore() {
    if (!canLoadMore || isLoading) {
      return;
    }

    if (_shouldLoad) {
      onLoadMore();
    }
  }

  void checkAndLoadMore() {
    _checkAndLoadMore();

    if (canLoadMore && !isLoading && _shouldLoad) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        checkAndLoadMore();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
