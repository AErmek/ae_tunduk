import 'dart:convert';
import 'dart:isolate';

import 'package:cv_scan_data/src/local/dao/candidates_dao.dart';
import 'package:cv_scan_data/src/local/mappers/candidate_local_mapper.dart';
import 'package:cv_scan_data/src/remote/mock/candidate_patch_result.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store.dart';
import 'package:flutter/services.dart';

final class MockServerStoreInitializer {
  MockServerStoreInitializer({
    required this.store,
    required this.candidatesDao,
    this.assetPath = 'mock/candidates.json',
  });

  final MockServerStore store;
  final CandidatesDao candidatesDao;
  final String assetPath;

  Future<void>? _initFuture;

  /// Memoized — concurrent callers await the same initialization.
  Future<void> ensureInitialized() => _initFuture ??= _initialize();

  Future<void> _initialize() async {
    final jsonString = await rootBundle.loadString(assetPath);
    final records = await Isolate.run(() {
      final decoded = jsonDecode(jsonString) as List<dynamic>;
      return decoded.cast<CandidateRecord>();
    });

    final localRows = await candidatesDao.getAll();
    final restoreChanges = localRows.map((row) => row.toDomainChange()).toList();

    store.seed(records, restoreChanges: restoreChanges);
  }
}
