part of 'pin_setup_bloc.dart';

@freezed
sealed class PinSetupState with _$PinSetupState {
  const factory PinSetupState.awaitingFirst() = _AwaitingFirst;
  const factory PinSetupState.awaitingConfirmation() = _AwaitingConfirmation;
  const factory PinSetupState.mismatch() = _Mismatch;
  const factory PinSetupState.biometricPrompt() = _BiometricPrompt;
}
