import 'package:cv_scan_data/src/datasources/candidate_remote_data_source.dart';
import 'package:cv_scan_data/src/remote/error_mapper.dart';
import 'package:cv_scan_data/src/remote/generated/api/api_client.dart';
import 'package:cv_scan_data/src/remote/mappers/candidate_mapper.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:dio/dio.dart';

class CandidateRemoteDataSourceImpl implements CandidateRemoteDataSource {
  CandidateRemoteDataSourceImpl({required this._apiClient});

  final ApiClient _apiClient;

  @override
  Future<Page<Candidate>> fetchCandidates({required int page, required int size}) async {
    try {
      final response = await _apiClient.listCandidates(page: page, size: size);
      return Page(
        items: response.items.map((dto) => dto.toDomain()).toList(),
        page: response.page,
        size: response.size,
        total: response.total,
      );
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }

  @override
  Future<Candidate> fetchCandidate(String id) async {
    try {
      final dto = await _apiClient.getCandidate(id: id);
      return dto.toDomain();
    } on DioException catch (e) {
      throw mapDioError(e);
    }
  }
}
