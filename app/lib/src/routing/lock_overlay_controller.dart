import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

class LockOverlayController {
  LockOverlayController({required this._authBloc});

  final AuthStatusBloc _authBloc;

  /// The biometric prompt churns the app lifecycle when it closes — that
  /// pause/hide can arrive just after unlock and look like a real background.
  /// Ignore lifecycle locks for a short window after unlocking.
  // static const _relockGrace = Duration(seconds: 2);

  AppLifecycleListener? _lifecycle;
  // DateTime? _unlockedAt;

  void start() {
    _lifecycle = AppLifecycleListener(onPause: _lockForOverlay, onHide: _lockForOverlay);
    // _authBloc.stream
    //     .map((s) => s.info)
    //     .where((info) => info is AuthorizedUser && info.lockedStatus == UserLockedStatus.unlocked)
    //     .listen((_) => _unlockedAt = DateTime.now());
  }

  void dispose() => _lifecycle?.dispose();

  void _lockForOverlay() {
    // final unlockedAt = _unlockedAt;
    // if (unlockedAt != null && DateTime.now().difference(unlockedAt) < _relockGrace) return;

    final info = _authBloc.state.info;
    if (info is AuthorizedUser && info.lockedStatus == UserLockedStatus.unlocked) {
      _authBloc.add(const AuthStatusEvent.lockedStatusSet(UserLockedStatus.overlay));
    }
  }
}
