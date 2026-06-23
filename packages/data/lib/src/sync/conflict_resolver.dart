import 'package:cv_scan_data/src/sync/conflict_resolution.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

class ConflictResolver {
  const ConflictResolver();

  ConflictResolution resolve({
    required ConflictStrategy strategy,
    required SyncConflict conflict,
    required String? localStatus,
    required String? localNote,
  }) {
    final serverVersion = conflict.currentVersion;

    return switch (strategy) {
      ConflictStrategy.serverWins => const AcceptServer(),
      ConflictStrategy.clientWins => Rebase(baseVersion: serverVersion, status: localStatus, note: localNote),
      ConflictStrategy.mergeNotes => Rebase(
        baseVersion: serverVersion,
        status: localStatus,
        note: _mergeNotes(conflict.current.note, localNote),
      ),
    };
  }

  String? _mergeNotes(String? serverNote, String? localNote) {
    if (serverNote == null || serverNote.isEmpty) return localNote;
    if (localNote == null || localNote.isEmpty) return serverNote;
    if (serverNote == localNote) return serverNote;
    return '$serverNote\n---\n$localNote';
  }
}
