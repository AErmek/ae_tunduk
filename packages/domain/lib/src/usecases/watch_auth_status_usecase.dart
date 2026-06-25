import 'package:cv_scan_domain/src/models/user_auth_info.dart';
import 'package:cv_scan_domain/src/repositories/auth_repository.dart';

class WatchAuthStatusUseCase {
  const WatchAuthStatusUseCase(this._repository);

  final AuthRepository _repository;

  Stream<UserAuthInfo> call() => _repository.authStatus;
}
