part of 'pin_verify_bloc.dart';

@freezed
sealed class PinVerifyEvent with _$PinVerifyEvent {
  const factory PinVerifyEvent.started() = _Started;
  const factory PinVerifyEvent.pinSubmitted(String pin) = _PinSubmitted;
  const factory PinVerifyEvent.biometricRequested() = _BiometricRequested;
}
