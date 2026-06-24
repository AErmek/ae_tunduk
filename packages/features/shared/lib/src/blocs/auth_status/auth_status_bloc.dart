import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status_bloc.freezed.dart';
part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc({required this._watchAuthStatus, required this._setUnauthenticated})
    : super(const AuthStatusState.restoring()) {
    on<AuthStatusEvent>(
      (event, emit) => switch (event) {
        _AuthStatusStarted() => _onStarted(event, emit),
        _AuthStatusLoggedOut() => _onLoggedOut(event, emit),
        _AuthStatusChanged() => _onStatusChanged(event, emit),
      },
    );

    _subscription = _watchAuthStatus()
        .where((status) => state.shouldUpdateStatus(status))
        .listen((status) => add(AuthStatusEvent.changed(status)), cancelOnError: false);
  }

  final WatchAuthStatusUseCase _watchAuthStatus;
  final SetUnauthenticatedUseCase _setUnauthenticated;

  StreamSubscription<AuthStatus>? _subscription;

  Future<void> _onStarted(_AuthStatusStarted event, Emitter<AuthStatusState> emit) async {}

  void _onStatusChanged(_AuthStatusChanged event, Emitter<AuthStatusState> emit) {
    emit(switch (event.status) {
      AuthStatus.restoring => const AuthStatusState.restoring(),
      AuthStatus.authenticated => const AuthStatusState.authenticated(),
      AuthStatus.unauthenticated => const AuthStatusState.unauthenticated(),
    });
  }

  Future<void> _onLoggedOut(_AuthStatusLoggedOut event, Emitter<AuthStatusState> emit) async {
    await _setUnauthenticated();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
