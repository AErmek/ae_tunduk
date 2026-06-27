import 'dart:async';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/dao/outbox_dao.dart';
import 'package:cv_scan_data/src/services/sync/sync_scheduler_impl.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/fakes.dart';

class _MockOutboxDao extends Mock implements OutboxDao {}

/// Wires a scheduler with fully faked collaborators. [pending] drives the
/// outbox's hasPending stream; the test owns its lifecycle.
({SyncSchedulerImpl scheduler, FakeSyncEngine engine, FakeNetworkMonitor monitor, StreamController<bool> pending, List<SyncSnapshot> snaps})
_build({bool online = true, ExponentialBackoff backoff = const ExponentialBackoff(jitter: false, maxAttempts: 2)}) {
  final pending = StreamController<bool>.broadcast();
  final outbox = _MockOutboxDao();
  when(() => outbox.watchHasPending()).thenAnswer((_) => pending.stream);

  final engine = FakeSyncEngine();
  final monitor = FakeNetworkMonitor(online: online);
  final scheduler = SyncSchedulerImpl(engine: engine, outboxDao: outbox, networkMonitor: monitor, backoff: backoff);

  final snaps = <SyncSnapshot>[];
  scheduler.snapshot.listen(snaps.add);

  return (scheduler: scheduler, engine: engine, monitor: monitor, pending: pending, snaps: snaps);
}

void main() {
  test('runs when changes appear while online', () {
    fakeAsync((async) {
      final t = _build();
      t.scheduler.start();

      t.pending.add(true);
      async.flushMicrotasks();

      expect(t.engine.calls, 1);
      expect(t.snaps.last, isA<SyncIdle>());

      t.scheduler.stop();
    });
  });

  test('does not run while offline', () {
    fakeAsync((async) {
      final t = _build(online: false);
      t.scheduler.start();

      t.pending.add(true);
      async.flushMicrotasks();

      expect(t.engine.calls, 0);
      t.scheduler.stop();
    });
  });

  test('runs again once connectivity returns', () {
    fakeAsync((async) {
      final t = _build(online: false);
      t.scheduler.start();
      t.pending.add(true);
      async.flushMicrotasks();
      expect(t.engine.calls, 0);

      t.monitor.emit(true);
      async.flushMicrotasks();

      expect(t.engine.calls, 1);
      t.scheduler.stop();
    });
  });

  test('keeps passing while the engine reports rebases, bounded by maxPasses', () {
    fakeAsync((async) {
      final t = _build();
      t.engine.onRun = (_) => const SyncPass(rebased: true);
      t.scheduler.start();

      t.pending.add(true);
      async.flushMicrotasks();

      expect(t.engine.calls, 5); // default maxPasses
      t.scheduler.stop();
    });
  });

  test('retries a failing pass with backoff and stops after maxAttempts (no infinite loop)', () {
    fakeAsync((async) {
      final t = _build(backoff: const ExponentialBackoff(jitter: false, maxAttempts: 2));
      t.engine.error = Exception('down');
      t.scheduler.start();

      t.pending.add(true);
      async.flushMicrotasks();
      expect(t.engine.calls, 1); // first attempt

      async.elapse(const Duration(minutes: 1)); // let every scheduled retry fire

      expect(t.engine.calls, 3); // initial + 2 retries, then gives up
      expect(t.snaps.last, isA<SyncFailed>());
      t.scheduler.stop();
    });
  });

  test('deduplicates concurrent triggers into one run plus a single rerun', () {
    fakeAsync((async) {
      final t = _build();
      final gate = Completer<void>();
      t.engine.gate = gate; // hold the first pass in-flight

      t.scheduler.start();
      t.pending.add(true);
      async.flushMicrotasks();
      expect(t.engine.calls, 1); // running

      t.scheduler.triggerNow(); // arrives mid-flight → coalesced into a rerun
      t.scheduler.triggerNow();
      async.flushMicrotasks();
      expect(t.engine.calls, 1); // still just the in-flight one

      t.engine.gate = null; // subsequent passes complete immediately
      gate.complete();
      async.flushMicrotasks();

      expect(t.engine.calls, 2); // exactly one rerun, not three
      t.scheduler.stop();
    });
  });
}
