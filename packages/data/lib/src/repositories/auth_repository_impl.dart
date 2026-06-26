import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this._pinService});

  final _controller = StreamController<UserAuthInfo>.broadcast();
  UserAuthInfo _current = const RestoringUser();

  final PinService _pinService;

  @override
  Stream<UserAuthInfo> get authStatus async* {
    yield _current;
    yield* _controller.stream;
  }

  @override
  Future<void> restore() async {
    _current = const RestoringUser();
    _controller.add(_current);

    final hasPin = await _pinService.hasPin();

    if (!hasPin) {
      _current = const UnauthorizedUser();
      _pinService.clear().ignore();
    } else {
      _current = const AuthorizedUser(lockedStatus: UserLockedStatus.coldStart);
    }

    _controller.add(_current);
  }

  @override
  Future<void> setAuthenticated({required String pin}) async {
    await _pinService.savePin(pin);

    _current = const AuthorizedUser(lockedStatus: UserLockedStatus.unlocked);
    _controller.add(_current);
  }

  @override
  Future<void> setUnauthenticated() async {
    _pinService.clear().ignore();

    _current = const UnauthorizedUser();
    _controller.add(_current);
  }

  @override
  Future<void> setLockedStatus(UserLockedStatus status) async {
    final current = _current;
    if (current is! AuthorizedUser) return;

    if (!current.lockedStatus.canOverride(status)) {
      return;
    }

    _current = AuthorizedUser(lockedStatus: status);
    _controller.add(_current);
  }

  void dispose() => _controller.close();
}
