part of 'auth_status_bloc.dart';

@freezed
sealed class AuthStatusEvent with _$AuthStatusEvent {
  const factory AuthStatusEvent.restored() = _AuthStatusRestored;
  const factory AuthStatusEvent.lockedStatusSet(UserLockedStatus status) = _AuthLockedStatusSet;
  const factory AuthStatusEvent.changed(UserAuthInfo info) = _AuthStatusChanged;
}
