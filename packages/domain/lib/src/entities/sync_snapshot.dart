import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:equatable/equatable.dart';

/// Observable state of the background sync loop, surfaced to the UI.
sealed class SyncSnapshot extends Equatable {
  const SyncSnapshot();

  @override
  List<Object?> get props => [];
}

/// Nothing to sync, or the last run settled cleanly.
class SyncIdle extends SyncSnapshot {
  const SyncIdle();

  @override
  List<Object?> get props => [runtimeType];
}

/// A sync pass is in flight.
class SyncRunning extends SyncSnapshot {
  const SyncRunning();

  @override
  List<Object?> get props => [runtimeType];
}

/// The last run failed; a retry is scheduled or awaits the next trigger.
class SyncFailed extends SyncSnapshot {
  const SyncFailed(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [runtimeType, failure];
}
