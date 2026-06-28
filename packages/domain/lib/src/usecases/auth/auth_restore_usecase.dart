import 'package:cv_scan_domain/cv_scan_domain.dart';

class AuthRestoreStatusUseCase {
  const AuthRestoreStatusUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call() => _repository.restore();
}
