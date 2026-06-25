part of 'auth_status_bloc.dart';

@freezed
sealed class AuthStatusState with _$AuthStatusState {
  const AuthStatusState._();

  const factory AuthStatusState.restoring() = _AuthStatusRestoring;
  const factory AuthStatusState.authenticated(UserAuthInfo info) = _AuthStatusAuthenticated;
  const factory AuthStatusState.unauthenticated() = _AuthStatusUnauthenticated;

  UserAuthInfo? get info => switch (this) {
    _AuthStatusAuthenticated(:final info) => info,
    _ => null,
  };

  bool routerDistinct(AuthStatusState previous) => switch (this) {
    _AuthStatusRestoring() => previous is! _AuthStatusRestoring,
    _AuthStatusAuthenticated(:final info) => previous is! _AuthStatusAuthenticated || previous.info != info,
    _AuthStatusUnauthenticated() => previous is! _AuthStatusUnauthenticated,
  };
}
