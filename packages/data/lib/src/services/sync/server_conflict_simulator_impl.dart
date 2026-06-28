import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store_initializer.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Drives [MockServerStore] from the outbox to manufacture sync conflicts:
/// every candidate with a pending change gets a fresh server version.
class ServerConflictSimulatorImpl implements ServerConflictSimulator {
  ServerConflictSimulatorImpl({
    required this.outboxDao,
    required this.store,
    required this.initializer,
  });

  final OutboxDao outboxDao;
  final MockServerStore store;
  final MockServerStoreInitializer initializer;

  @override
  Future<int> conflictPending() async {
    await initializer.ensureInitialized();

    final pending = await outboxDao.getPending();
    final seen = <String>{};
    var changed = 0;

    for (final row in pending) {
      if (!seen.add(row.candidateId)) continue;
      if (store.forceServerEdit(row.candidateId) != null) changed++;
    }

    return changed;
  }
}
