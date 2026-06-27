import 'dart:async';

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'candidate_detail_bloc.freezed.dart';
part 'candidate_detail_event.dart';
part 'candidate_detail_state.dart';

/// Detail screen over the local mirror: reads are an outbox-overlaid stream, so
/// status/note edits show optimistically the moment they're enqueued; the
/// background scheduler reconciles them with the server.
class CandidateDetailBloc extends Bloc<CandidateDetailEvent, CandidateDetailState> {
  CandidateDetailBloc({
    required this._id,
    required this._getCandidate,
    required this._fetchCandidate,
    required this._updateCandidate,
    required this._watchPending,
    required this._networkMonitor,
  }) : super(const CandidateDetailState()) {
    on<_Started>(_onStarted);
    on<_CandidateUpdated>(_onCandidateUpdated);
    on<_StatusChanged>(_onStatusChanged);
    on<_NoteSubmitted>(_onNoteSubmitted);
    on<_PendingChanged>(_onPendingChanged);
    on<_OnlineChanged>(_onOnlineChanged);
    on<_ShareRequested>(_onShareRequested);
  }

  final String _id;
  final GetCandidateUseCase _getCandidate;
  final FetchCandidateUseCase _fetchCandidate;
  final UpdateCandidateUseCase _updateCandidate;
  final WatchCandidatePendingUseCase _watchPending;
  final NetworkMonitor _networkMonitor;

  StreamSubscription<Candidate?>? _candidateSub;
  StreamSubscription<bool>? _pendingSub;
  StreamSubscription<bool>? _onlineSub;

  @override
  Future<void> close() {
    _candidateSub?.cancel();
    _pendingSub?.cancel();
    _onlineSub?.cancel();
    return super.close();
  }

  Future<void> _onStarted(_Started event, Emitter<CandidateDetailState> emit) async {
    emit(state.copyWith(load: const RequestStatus<int>.loading(), isOnline: _networkMonitor.isOnline));

    _candidateSub ??= _getCandidate(_id).listen((c) => add(CandidateDetailEvent.candidateUpdated(c)));
    _pendingSub ??= _watchPending(_id).listen((p) => add(CandidateDetailEvent.pendingChanged(p)));
    _onlineSub ??= _networkMonitor.onlineChanges.listen((o) => add(CandidateDetailEvent.onlineChanged(o)));

    // Mirror may not hold this candidate yet — pull it once. The overlaid stream
    // re-emits and resolves [load]; offline failures surface only on the op.
    if (state.candidate == null) {
      try {
        await _fetchCandidate(_id);
      } on Failure catch (failure) {
        if (state.candidate == null) emit(state.copyWith(load: RequestStatus<int>.failTrigger(failure)));
      } catch (_) {
        if (state.candidate == null) emit(state.copyWith(load: const RequestStatus<int>.failTrigger(UnknownFailure())));
      }
    }
  }

  void _onCandidateUpdated(_CandidateUpdated event, Emitter<CandidateDetailState> emit) => emit(
    state.copyWith(
      candidate: event.candidate,
      load: event.candidate != null ? const RequestStatus<int>.done() : state.load,
    ),
  );

  Future<void> _onStatusChanged(_StatusChanged event, Emitter<CandidateDetailState> emit) =>
      _save(emit, (c) => _updateCandidate(id: c.id, version: c.version, status: event.status));

  Future<void> _onNoteSubmitted(_NoteSubmitted event, Emitter<CandidateDetailState> emit) =>
      _save(emit, (c) => _updateCandidate(id: c.id, version: c.version, note: event.note));

  Future<void> _save(Emitter<CandidateDetailState> emit, Future<Candidate> Function(Candidate candidate) action) async {
    final candidate = state.candidate;
    if (candidate == null) return;

    emit(state.copyWith(save: const RequestStatus<int>.loading()));
    try {
      await action(candidate);
      emit(state.copyWith(save: const RequestStatus<int>.done()));
    } on Failure catch (failure) {
      emit(state.copyWith(save: RequestStatus<int>.failTrigger(failure)));
    } catch (_) {
      emit(state.copyWith(save: const RequestStatus<int>.failTrigger(UnknownFailure())));
    }
  }

  void _onPendingChanged(_PendingChanged event, Emitter<CandidateDetailState> emit) =>
      emit(state.copyWith(hasPending: event.hasPending));

  void _onOnlineChanged(_OnlineChanged event, Emitter<CandidateDetailState> emit) =>
      emit(state.copyWith(isOnline: event.isOnline));

  void _onShareRequested(_ShareRequested event, Emitter<CandidateDetailState> emit) {
    final candidate = state.candidate;
    if (candidate == null) return;
    final link = Config.i.app.shareCandidateUrl(candidate.id);
    emit(state.copyWith(share: RequestStatus<String>.doneTrigger(link)));
  }
}
