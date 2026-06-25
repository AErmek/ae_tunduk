import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status_bloc.freezed.dart';
part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc({
    required WatchAuthStatusUseCase watchAuthStatus,
    required this._setLockedStatus,
    required this._restoreStatus,
  }) : super(const AuthStatusState.restoring()) {
    on<AuthStatusEvent>(
      (event, emit) => switch (event) {
        _AuthStatusRestored() => _onRestored(event, emit),
        _AuthLockedStatusSet() => _onLockedStatusSet(event, emit),
        _AuthStatusChanged() => _onChanged(event, emit),
      },
    );

    _subscription = watchAuthStatus().listen((info) => add(AuthStatusEvent.changed(info)), cancelOnError: false);
  }

  final AuthSetLockedStatusUseCase _setLockedStatus;
  final AuthRestoreStatusUseCase _restoreStatus;

  StreamSubscription<UserAuthInfo>? _subscription;

  Future<void> _onRestored(_AuthStatusRestored event, Emitter<AuthStatusState> emit) async {
    await _restoreStatus();
  }

  Future<void> _onLockedStatusSet(_AuthLockedStatusSet event, Emitter<AuthStatusState> emit) =>
      _setLockedStatus(event.status);

  void _onChanged(_AuthStatusChanged event, Emitter<AuthStatusState> emit) {
    emit(switch (event.info) {
      RestoringUser() => const AuthStatusState.restoring(),
      AuthorizedUser() => AuthStatusState.authenticated(event.info),
      UnauthorizedUser() => const AuthStatusState.unauthenticated(),
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
