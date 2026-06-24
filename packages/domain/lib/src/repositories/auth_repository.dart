import 'package:cv_scan_domain/src/enums/auth_status.dart';

abstract interface class AuthRepository {
  Stream<AuthStatus> get authStatus;
  Future<void> setAuthenticated();
  Future<void> setUnauthenticated();
}
