import 'dart:async';

import 'package:cv_scan_data/src/datasources/candidate_local_data_source.dart';
import 'package:cv_scan_data/src/datasources/candidate_remote_data_source.dart';
import 'package:cv_scan_data/src/sync/sync_engine.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  CandidateRepositoryImpl({required this._remote, required this._local, required this._syncEngine});

  final CandidateRemoteDataSource _remote;
  final CandidateLocalDataSource _local;
  final SyncEngine _syncEngine;

  @override
  Stream<List<Candidate>> watchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) => _local.watchCandidates();

  @override
  Stream<Candidate?> watchCandidate(String id) => _local.watchCandidate(id);

  @override
  Future<Page<Candidate>> fetchCandidates({
    required int page,
    required int size,
    CandidateVerdict? verdict,
    String? query,
    SortField sort = SortField.dateAdded,
  }) async {
    final remotePage = await _remote.fetchCandidates(page: page, size: size);
    await _local.cacheCandidates(remotePage.items);

    final cached = await _local.getCandidates();
    return Page(items: cached, page: remotePage.page, size: remotePage.size, total: remotePage.total);
  }

  @override
  Future<Candidate> fetchCandidate(String id) async {
    final candidate = await _remote.fetchCandidate(id);
    await _local.cacheCandidate(candidate);
    return candidate;
  }

  @override
  Future<Candidate> updateCandidate({
    required String id,
    required int version,
    CandidateStatus? status,
    String? note,
  }) async {
    // The change lives in the outbox and is overlaid on reads — the mirror only
    // changes on confirmed sync.
    await _local.enqueueUpdate(id: id, version: version, status: status, note: note);

    final candidate = await _local.getCandidate(id);
    if (candidate == null) throw StateError('Candidate $id not found');
    return candidate;
  }

  @override
  Future<SyncResult> sync() => _syncEngine.run();
}
