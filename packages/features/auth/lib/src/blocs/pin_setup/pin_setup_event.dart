part of 'pin_setup_bloc.dart';

@freezed
sealed class PinSetupEvent with _$PinSetupEvent {
  const factory PinSetupEvent.pinSubmitted(String pin) = _PinSubmitted;
  const factory PinSetupEvent.biometricDecided({required bool enabled}) = _BiometricDecided;
}
