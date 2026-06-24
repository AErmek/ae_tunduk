import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _controller = StreamController<AuthStatus>.broadcast();
  AuthStatus _current = AuthStatus.restoring;

  @override
  Stream<AuthStatus> get authStatus async* {
    yield _current;
    yield* _controller.stream;
  }

  @override
  Future<void> setAuthenticated() async {
    _current = AuthStatus.authenticated;
    _controller.add(_current);
  }

  @override
  Future<void> setUnauthenticated() async {
    _current = AuthStatus.unauthenticated;
    _controller.add(_current);
  }

  void dispose() => _controller.close();
}
