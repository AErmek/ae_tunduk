import 'package:cv_scan_domain/src/repositories/auth_repository.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

/// Ends the session: clears local candidate data and the outbox, then the PIN.
class LogoutUseCase {
  const LogoutUseCase(this._auth, this._candidates);

  final AuthRepository _auth;
  final CandidateRepository _candidates;

  Future<void> call() async {
    await _candidates.clearLocalData();
    await _auth.setUnauthenticated();
  }
}
