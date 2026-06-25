import 'package:flutter/material.dart';

mixin AppLifecycleMixin<T extends StatefulWidget> on State<T> {
  late final AppLifecycleListener _lifecycleObserver;

  @override
  void initState() {
    super.initState();
    _lifecycleObserver = AppLifecycleListener(
      onResume: onResumed,
      onPause: onPaused,
      onDetach: onDetached,
      onHide: onHidden,
    );
  }

  @override
  void dispose() {
    _lifecycleObserver.dispose();
    super.dispose();
  }

  void onResumed() {}
  void onPaused() {}
  void onDetached() {}
  void onHidden() {}
}
