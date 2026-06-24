part of 'auth_status_bloc.dart';

@freezed
sealed class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState.restoring() = _AuthStatusRestoring;
  const factory AuthStatusState.authenticated() = _AuthStatusAuthenticated;
  const factory AuthStatusState.unauthenticated() = _AuthStatusUnauthenticated;

  bool shouldUpdateStatus(AuthStatus status) => switch (this) {
    _AuthStatusRestoring() => true,
    _AuthStatusAuthenticated() => status != AuthStatus.authenticated,
    _AuthStatusUnauthenticated() => status != AuthStatus.unauthenticated,
  };
}
