import 'package:cv_scan_domain/src/enums/auth_status.dart';
import 'package:cv_scan_domain/src/repositories/auth_repository.dart';

class WatchAuthStatusUseCase {
  const WatchAuthStatusUseCase(this._repository);

  final AuthRepository _repository;

  Stream<AuthStatus> call() => _repository.authStatus;
}
