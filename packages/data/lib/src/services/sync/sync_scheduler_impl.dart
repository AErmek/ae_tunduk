import 'dart:async';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Coordinates *when* the outbox is flushed: it runs the engine whenever there
/// are pending changes and the device is online, collapses concurrent triggers
/// into a single pass, and retries failed passes with exponential backoff.
class SyncSchedulerImpl implements SyncScheduler {
  SyncSchedulerImpl({
    required this._engine,
    required this._outboxDao,
    required this._networkMonitor,
    this.backoff = const ExponentialBackoff(),
    this.maxPasses = 5,
  });

  final SyncEngine _engine;
  final OutboxDao _outboxDao;
  final NetworkMonitor _networkMonitor;
  final ExponentialBackoff backoff;

  /// Upper bound on conflict-rebase passes per run — guards against a server
  /// that keeps reporting conflicts.
  final int maxPasses;

  final StreamController<SyncSnapshot> _snapshots = StreamController<SyncSnapshot>.broadcast();
  SyncSnapshot _current = const SyncIdle();

  StreamSubscription<bool>? _pendingSub;
  StreamSubscription<bool>? _onlineSub;
  Timer? _retryTimer;

  bool _started = false;
  bool _running = false;
  bool _rerunRequested = false;
  int _attempt = 0;

  bool _hasPending = false;
  late bool _isOnline = _networkMonitor.isOnline;

  @override
  Stream<SyncSnapshot> get snapshot async* {
    yield _current;
    yield* _snapshots.stream;
  }

  @override
  void start() {
    if (_started) return;
    _started = true;

    _pendingSub = _outboxDao.watchHasPending().listen((hasPending) {
      final gained = hasPending && !_hasPending;
      _hasPending = hasPending;
      if (gained) _attempt = 0; // fresh work — start retries from scratch
      _maybeRun();
    });

    _onlineSub = _networkMonitor.onlineChanges.listen((online) {
      final restored = online && !_isOnline;
      _isOnline = online;
      if (restored) _attempt = 0; // connectivity is back — retry immediately
      _maybeRun();
    });
  }

  @override
  void stop() {
    _started = false;
    _retryTimer?.cancel();
    _pendingSub?.cancel();
    _onlineSub?.cancel();
    _pendingSub = null;
    _onlineSub = null;
  }

  @override
  void triggerNow() {
    _attempt = 0;
    _maybeRun();
  }

  void _maybeRun() {
    if (!_isOnline || !_hasPending) return;
    if (_running) {
      _rerunRequested = true;
      return;
    }
    _retryTimer?.cancel();
    unawaited(_run());
  }

  Future<void> _run() async {
    _running = true;
    _emit(const SyncRunning());
    try {
      for (var pass = 0; pass < maxPasses; pass++) {
        final outcome = await _engine.runOnce();
        if (!outcome.rebased) break; // nothing left another pass could fix
      }
      _attempt = 0;
      _emit(const SyncIdle());
    } on Object catch (error) {
      _emit(SyncFailed(_asFailure(error)));
      _scheduleRetry();
    } finally {
      _running = false;
      if (_rerunRequested) {
        _rerunRequested = false;
        _maybeRun();
      }
    }
  }

  void _scheduleRetry() {
    if (!backoff.hasAttemptsLeft(_attempt)) return;
    final delay = backoff.delayFor(_attempt);
    _attempt++;
    _retryTimer?.cancel();
    _retryTimer = Timer(delay, () {
      if (_running) return;
      if (_isOnline && _hasPending) unawaited(_run());
    });
  }

  void _emit(SyncSnapshot snapshot) {
    _current = snapshot;
    if (!_snapshots.isClosed) _snapshots.add(snapshot);
  }

  Failure _asFailure(Object error) => switch (error) {
    final Failure failure => failure,
    _ => const NetworkFailure(),
  };

  Future<void> dispose() async {
    stop();
    await _snapshots.close();
  }
}
