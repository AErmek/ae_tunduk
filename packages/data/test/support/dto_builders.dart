import 'package:cv_scan_data/src/remote/generated/models/candidate.dart' as dto;
import 'package:cv_scan_data/src/remote/generated/models/conflict.dart' as dto;
import 'package:cv_scan_data/src/remote/generated/models/sync_response.dart';

/// Test [dto.Candidate] built via `fromJson`.
dto.Candidate dtoCandidate({String id = 'c1', int version = 1, String status = 'new', String? note}) =>
    dto.Candidate.fromJson({
      'id': id,
      'name': 'Jane Doe',
      'position': 'flutter',
      'pos_label': 'Flutter Engineer',
      'verdict': 'fits',
      'vc': 'verdict-green',
      'status': status,
      'version': version,
      'note': ?note,
    });

dto.Conflict dtoConflict({String id = 'c1', int currentVersion = 5, String status = 'review', String? note}) =>
    dto.Conflict(
      code: 'VERSION_CONFLICT',
      id: id,
      currentVersion: currentVersion,
      current: dtoCandidate(id: id, version: currentVersion, status: status, note: note),
    );

SyncResponse syncResponse({List<dto.Candidate> applied = const [], List<dto.Conflict> conflicts = const []}) =>
    SyncResponse(applied: applied, conflicts: conflicts);
