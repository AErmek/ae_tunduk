import 'package:cv_scan_domain/src/services/sync/server_conflict_simulator.dart';

/// Forces server-side edits for pending changes so conflicts can be tested.
class SimulateServerConflictUseCase {
  const SimulateServerConflictUseCase(this._simulator);

  final ServerConflictSimulator _simulator;

  Future<int> call() => _simulator.conflictPending();
}
