import 'package:cv_scan_domain/src/repositories/auth_repository.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

/// Ends the session: wipes locally cached candidate data and the pending-change
/// outbox first, then clears the PIN and marks the user unauthenticated. Local
/// data is cleared so nothing outlives the session on a shared device and no
/// orphaned change syncs under a future login.
class LogoutUseCase {
  const LogoutUseCase(this._auth, this._candidates);

  final AuthRepository _auth;
  final CandidateRepository _candidates;

  Future<void> call() async {
    await _candidates.clearLocalData();
    await _auth.setUnauthenticated();
  }
}
