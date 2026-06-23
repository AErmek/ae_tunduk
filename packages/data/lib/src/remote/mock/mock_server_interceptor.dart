import 'package:cv_scan_data/src/remote/mock/candidate_patch_result.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_response_processor.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store.dart';
import 'package:cv_scan_data/src/remote/mock/mock_server_store_initializer.dart';
import 'package:dio/dio.dart';

class MockServerInterceptor extends QueuedInterceptor {
  MockServerInterceptor({required this.store, required this.initializer});

  final MockServerStore store;
  final MockServerStoreInitializer initializer;
  final MockServerResponseProcessor responseProcessor = MockServerResponseProcessor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await initializer.ensureInitialized();

    final path = options.path;
    final method = options.method.toUpperCase();

    if (method == 'GET' && path == '/candidates') {
      _list(options, handler);
    } else if (method == 'GET' && _isItemPath(path)) {
      _get(options, handler);
    } else if (method == 'PATCH' && _isItemPath(path)) {
      _patch(options, handler);
    } else if (method == 'POST' && path == '/sync') {
      _sync(options, handler);
    } else {
      responseProcessor.notFound(options, handler);
    }
  }

  bool _isItemPath(String path) => path.startsWith('/candidates/') && path.split('/').length == 3;

  void _list(RequestOptions options, RequestInterceptorHandler handler) {
    final q = options.queryParameters;
    final data = store.query(
      page: q['page'] as int? ?? 0,
      size: q['size'] as int? ?? 10,
      verdict: q['verdict'] as String?,
      query: q['q'] as String?,
    );
    responseProcessor.success(options, handler, data);
  }

  void _get(RequestOptions options, RequestInterceptorHandler handler) {
    final id = options.path.split('/').last;
    final record = store.getById(id);
    if (record == null) {
      responseProcessor.notFound(options, handler);
      return;
    }
    responseProcessor.success(options, handler, record);
  }

  void _patch(RequestOptions options, RequestInterceptorHandler handler) {
    final id = options.path.split('/').last;
    final body = (options.data as Map).cast<String, dynamic>();
    final outcome = store.patch(
      id: id,
      ifMatch: options.headers['If-Match'] as int,
      status: body['status'] as String?,
      noteProvided: body.containsKey('note'),
      note: body['note'] as String?,
    );

    switch (outcome.status) {
      case CandidatePatchStatus.applied:
        responseProcessor.success(options, handler, outcome.record);
      case CandidatePatchStatus.conflict:
        responseProcessor.conflict(options, handler, candidateConflictModel(id, outcome.record!));
      case CandidatePatchStatus.notFound:
        responseProcessor.notFound(options, handler);
    }
  }

  void _sync(RequestOptions options, RequestInterceptorHandler handler) {
    final body = (options.data as Map).cast<String, dynamic>();
    final changes = (body['changes'] as List).cast<Map<String, dynamic>>();
    final data = store.sync(changes);
    responseProcessor.success(options, handler, data);
  }
}
