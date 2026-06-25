import 'package:cv_scan_domain/cv_scan_domain.dart';

class AuthSetLockedStatusUseCase {
  const AuthSetLockedStatusUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(UserLockedStatus status) => _repository.setLockedStatus(status);
}
