import 'package:cv_scan_domain/src/repositories/auth_repository.dart';

class SetUnauthenticatedUseCase {
  const SetUnauthenticatedUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call() => _repository.setUnauthenticated();
}
