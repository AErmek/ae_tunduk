import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Pushes pending candidate changes to the server, applies accepted results and
/// resolves conflicts across passes.
abstract interface class CandidateSyncEngine {
  Future<SyncResult> run();
}
