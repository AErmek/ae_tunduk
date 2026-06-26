import 'dart:async';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

/// Owns the whole "overlay lock" feature: locks the app when it goes to the
/// background (only from an unlocked session) and lays the lock dialog on top
/// of the current stack — preserving the screen underneath instead of replacing
/// it like a redirect would.
///
/// Push storms are impossible: the lifecycle trigger only fires from `unlocked`,
/// the boolean projection is `distinct` (one reaction per transition), and a
/// visibility flag guards the push itself.
class LockOverlayController {
  LockOverlayController({required this._router, required this._navigatorKey, required this._authBloc});

  final GoRouter _router;
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthStatusBloc _authBloc;

  AppLifecycleListener? _lifecycle;
  StreamSubscription<bool>? _statusSubscription;
  bool _dialogVisible = false;

  void start() {
    _lifecycle = AppLifecycleListener(onPause: _lockForOverlay, onHide: _lockForOverlay);
    _statusSubscription = _authBloc.stream.map(_isOverlayLocked).distinct().listen(_onOverlayChanged);
  }

  void dispose() {
    _statusSubscription?.cancel();
    _lifecycle?.dispose();
  }

  void _lockForOverlay() {
    final info = _authBloc.state.info;
    if (info is AuthorizedUser && info.lockedStatus == UserLockedStatus.unlocked) {
      _authBloc.add(const AuthStatusEvent.lockedStatusSet(UserLockedStatus.overlay));
    }
  }

  bool _isOverlayLocked(AuthStatusState state) {
    final info = state.info;
    return info is AuthorizedUser && info.lockedStatus == UserLockedStatus.overlay;
  }

  void _onOverlayChanged(bool isOverlay) => isOverlay ? _show() : _hide();

  void _show() {
    if (_dialogVisible) return;
    _dialogVisible = true;
    _router.push(AppRoutes.lockDialog).whenComplete(() => _dialogVisible = false);
  }

  void _hide() {
    if (!_dialogVisible) return;
    _dialogVisible = false;
    _navigatorKey.currentState?.pop();
  }
}
