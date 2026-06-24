import 'package:cv_scan_domain/src/repositories/auth_repository.dart';

class SetAuthenticatedUseCase {
  const SetAuthenticatedUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call() => _repository.setAuthenticated();
}
