import 'package:cv_scan_domain/src/entities/candidate.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';
import 'package:cv_scan_domain/src/repositories/candidate_repository.dart';

class UpdateCandidateUseCase {
  const UpdateCandidateUseCase(this._repository);

  final CandidateRepository _repository;

  Future<Candidate> call({required String id, required int version, CandidateStatus? status, String? note}) =>
      _repository.updateCandidate(id: id, version: version, status: status, note: note);
}
