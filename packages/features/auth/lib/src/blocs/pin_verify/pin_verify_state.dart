part of 'pin_verify_bloc.dart';

@freezed
sealed class PinVerifyState with _$PinVerifyState {
  const factory PinVerifyState.idle() = _Idle;
  const factory PinVerifyState.loading() = _Loading;
  const factory PinVerifyState.error(String message) = _Error;
}
