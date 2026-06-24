part of 'auth_status_bloc.dart';

@freezed
sealed class AuthStatusEvent with _$AuthStatusEvent {
  const factory AuthStatusEvent.started() = _AuthStatusStarted;
  const factory AuthStatusEvent.loggedOut() = _AuthStatusLoggedOut;
  const factory AuthStatusEvent.changed(AuthStatus status) = _AuthStatusChanged;
}
