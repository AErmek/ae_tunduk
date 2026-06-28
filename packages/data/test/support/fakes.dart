// ignore_for_file: only_throw_errors

import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';

/// Programmable [SyncEngine] for scheduler tests. Records calls and lets a test
/// decide each pass's outcome (a [SyncPass] or a thrown error).
class FakeSyncEngine implements SyncEngine {
  int calls = 0;

  /// If set, every pass throws this.
  Object? error;

  /// Outcome per call (1-based). Defaults to a settled, non-rebasing pass.
  SyncPass Function(int call)? onRun;

  /// Optional gate to keep a pass in-flight until the test completes it.
  Completer<void>? gate;

  @override
  Future<SyncPass> runOnce() async {
    calls++;
    if (gate != null) await gate!.future;
    if (error != null) throw error!;
    return onRun?.call(calls) ?? SyncPass.empty;
  }
}

/// [NetworkMonitor] backed by a broadcast controller the test drives.
class FakeNetworkMonitor implements NetworkMonitor {
  FakeNetworkMonitor({this._online = true});

  final _controller = StreamController<bool>.broadcast();
  bool _online;

  @override
  bool get isOnline => _online;

  @override
  Stream<bool> get onlineChanges => _controller.stream;

  void emit({required bool online}) {
    _online = online;
    _controller.add(online);
  }

  Future<void> dispose() => _controller.close();
}
