import 'package:cv_scan_domain/src/models/user_auth_info.dart';

abstract interface class AuthRepository {
  Stream<UserAuthInfo> get authStatus;
  Future<void> restore();
  Future<void> setAuthenticated({required String pin});
  Future<void> setUnauthenticated();
  Future<void> setLockedStatus(UserLockedStatus status);
}
