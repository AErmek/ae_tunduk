import 'package:cv_scan_data/src/remote/mock/candidate_patch_result.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_response_processor.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

/// In-memory candidate store for the mock server.
/// Keeps an ordered list plus an index map for fast lookup.
class MockServerStore {
  final List<CandidateRecord> _ordered = [];
  final Map<String, CandidateRecord> _index = {};

  bool get isEmpty => _ordered.isEmpty;

  /// Seeds from mock json and re-applies the last confirmed changes,
  /// so versions stay consistent across restarts.
  void seed(List<CandidateRecord> fromJson, {List<CandidateChange> restoreChanges = const []}) {
    _ordered
      ..clear()
      ..addAll(fromJson);
    _index
      ..clear()
      ..addEntries(_ordered.map((r) => MapEntry(r['id'] as String, r)));

    for (final e in restoreChanges) {
      final record = _index[e.id];
      if (record == null) continue;
      record['version'] = e.version;
      record['status'] = e.status.apiKey;
      record['note'] = e.note;
    }
  }

  Map<String, dynamic> query({
    required int page,
    required int size,
    String? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) {
    var items = List<CandidateRecord>.from(_ordered);

    if (verdict != null) {
      items = items.where((c) => c['verdict'] == verdict).toList();
    }

    if (query != null && query.trim().isNotEmpty) {
      final q = query.toLowerCase();
      items = items.where((c) => (c['name'] as String).toLowerCase().contains(q)).toList();
    }

    _sort(items, sort);

    final total = items.length;
    final start = (page * size).clamp(0, total);
    final end = (start + size).clamp(0, total);
    final pageItems = items.sublist(start, end);

    return {'items': pageItems, 'page': page, 'size': size, 'total': total};
  }

  CandidateRecord? getById(String id) => _index[id];

  CandidatePatchResult patch({
    required String id,
    required int ifMatch,
    String? status,
    bool noteProvided = false,
    String? note,
  }) {
    final record = _index[id];
    if (record == null) return CandidatePatchResult.notFound;

    final currentVersion = record['version'] as int;
    if (ifMatch != currentVersion) return CandidatePatchResult.conflict(record);

    if (status != null) record['status'] = status;
    if (noteProvided) record['note'] = note;
    record['version'] = currentVersion + 1;

    return CandidatePatchResult.applied(record);
  }

  Map<String, dynamic> sync(List<Map<String, dynamic>> changes) {
    final applied = <CandidateRecord>[];
    final conflicts = <Map<String, dynamic>>[];

    for (final change in changes) {
      final outcome = patch(
        id: change['id'] as String,
        ifMatch: change['baseVersion'] as int,
        status: change['status'] as String?,
        noteProvided: change.containsKey('note'),
        note: change['note'] as String?,
      );

      switch (outcome.status) {
        case CandidatePatchStatus.applied:
          applied.add(outcome.record!);
        case CandidatePatchStatus.conflict:
          conflicts.add(candidateConflictModel(change['id'], outcome.record!));
        case CandidatePatchStatus.notFound:
          break;
      }
    }

    return {'applied': applied, 'conflicts': conflicts};
  }

  void _sort(List<CandidateRecord> items, SortField sort) {
    switch (sort) {
      case SortField.name:
        items.sort((a, b) => (a['name'] as String).compareTo(b['name'] as String));
      case SortField.experience:
        items.sort((a, b) => (a['total_exp'] as String? ?? '').compareTo(b['total_exp'] as String? ?? ''));
      case SortField.dateAdded:
        items.sort((a, b) => (b['date_added'] as String? ?? '').compareTo(a['date_added'] as String? ?? ''));
    }
  }
}
