import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'candidates_list_bloc.freezed.dart';
part 'candidates_list_event.dart';
part 'candidates_list_state.dart';

/// Offline-first list: the visible data is a growing window over the local
/// mirror (Drift); pulling a page just fills the mirror and the stream re-emits.
class CandidatesListBloc extends Bloc<CandidatesListEvent, CandidatesListState> {
  CandidatesListBloc({required this._getCandidates, required this._fetchCandidates, required this._networkMonitor})
    : super(const CandidatesListState()) {
    on<_Started>(_onStarted);
    on<_NextPageRequested>(_onNextPage, transformer: droppable());
    on<_Refreshed>(_onRefreshed, transformer: droppable());
    on<_VerdictChanged>(_onVerdictChanged);
    on<_QueryChanged>(_onQueryChanged, transformer: restartable());
    on<_SortChanged>(_onSortChanged);
    on<_CandidatesUpdated>(_onCandidatesUpdated);
    on<_OnlineChanged>(_onOnlineChanged);
  }

  final GetCandidatesUseCase _getCandidates;
  final FetchCandidatesUseCase _fetchCandidates;
  final NetworkMonitor _networkMonitor;

  StreamSubscription<List<CandidateLight>>? _candidatesSub;
  StreamSubscription<bool>? _onlineSub;

  @override
  Future<void> close() {
    _candidatesSub?.cancel();
    _onlineSub?.cancel();
    return super.close();
  }

  Future<void> _onStarted(_Started event, Emitter<CandidatesListState> emit) async {
    emit(state.copyWith(isOnline: _networkMonitor.isOnline));
    _onlineSub ??= _networkMonitor.onlineChanges.listen((online) => add(CandidatesListEvent.onlineChanged(online)));
    _resubscribe(state.filter);
    await _pull(state.filter, emit, refresh: true);
  }

  /// Re-points the local watch to the (possibly grown/refiltered) window.
  void _resubscribe(CandidatesFilter filter) {
    _candidatesSub?.cancel();
    _candidatesSub = _getCandidates(filter).listen((items) => add(CandidatesListEvent.candidatesUpdated(items)));
  }

  Future<void> _onNextPage(_NextPageRequested event, Emitter<CandidatesListState> emit) async {
    if (!state.hasMore || state.loadMore.isLoading || !state.isOnline) return;
    emit(state.copyWith(loadMore: const RequestStatus<int>.loading()));
    await _pull(state.filter.copyWith(page: state.filter.page + 1), emit, refresh: false);
  }

  Future<void> _onRefreshed(_Refreshed event, Emitter<CandidatesListState> emit) async {
    emit(state.copyWith(refresh: const RequestStatus<int>.loading()));
    await _pull(state.filter.firstPage(), emit, refresh: true);
  }

  /// Pulls [filter]'s remote page into the mirror and grows the window.
  /// Offline-first: failures never touch the visible list, only the op status.
  Future<void> _pull(CandidatesFilter filter, Emitter<CandidatesListState> emit, {required bool refresh}) async {
    try {
      final page = await _fetchCandidates(filter);
      _resubscribe(filter);
      emit(
        state.copyWith(
          filter: filter,
          hasMore: filter.limit < page.total,
          loadMore: refresh ? state.loadMore : const RequestStatus<int>.done(),
          refresh: refresh ? const RequestStatus<int>.done() : state.refresh,
        ),
      );
    } on Failure catch (failure) {
      emit(_withOpFailure(refresh: refresh, failure: failure));
    } catch (_) {
      emit(_withOpFailure(refresh: refresh, failure: const UnknownFailure()));
    }
  }

  CandidatesListState _withOpFailure({required bool refresh, required Failure failure}) => refresh
      ? state.copyWith(refresh: RequestStatus<int>.failTrigger(failure))
      : state.copyWith(loadMore: RequestStatus<int>.failTrigger(failure));

  void _onVerdictChanged(_VerdictChanged event, Emitter<CandidatesListState> emit) {
    final filter = state.filter.copyWith(verdict: event.verdict, resetVerdict: event.verdict == null).firstPage();
    emit(state.copyWith(filter: filter));
    _resubscribe(filter);
  }

  Future<void> _onQueryChanged(_QueryChanged event, Emitter<CandidatesListState> emit) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final filter = state.filter.copyWith(query: event.query).firstPage();
    emit(state.copyWith(filter: filter));
    _resubscribe(filter);
  }

  void _onSortChanged(_SortChanged event, Emitter<CandidatesListState> emit) {
    final filter = state.filter.copyWith(sort: event.sort).firstPage();
    emit(state.copyWith(filter: filter));
    _resubscribe(filter);
  }

  void _onCandidatesUpdated(_CandidatesUpdated event, Emitter<CandidatesListState> emit) =>
      emit(state.copyWith(items: event.items));

  void _onOnlineChanged(_OnlineChanged event, Emitter<CandidatesListState> emit) =>
      emit(state.copyWith(isOnline: event.isOnline));
}
