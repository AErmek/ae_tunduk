import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

class AppLifecycleController {
  AppLifecycleController({required this._authBloc, required this._syncScheduler});

  final AuthStatusBloc _authBloc;
  final SyncScheduler _syncScheduler;

  AppLifecycleListener? _lifecycle;

  void start() {
    _syncScheduler.start();

    _lifecycle = AppLifecycleListener(
      onPause: _lockForOverlay,
      onHide: _lockForOverlay,
      onResume: _syncScheduler.triggerNow,
    );
  }

  void dispose() {
    _lifecycle?.dispose();
    _syncScheduler.stop();
  }

  void _lockForOverlay() {
    final info = _authBloc.state.info;
    if (info is AuthorizedUser && info.lockedStatus == UserLockedStatus.unlocked) {
      _authBloc.add(const AuthStatusEvent.lockedStatusSet(UserLockedStatus.overlay));
    }
  }
}
