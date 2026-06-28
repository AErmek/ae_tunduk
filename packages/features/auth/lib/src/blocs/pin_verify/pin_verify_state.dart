part of 'pin_verify_bloc.dart';

@freezed
abstract class PinVerifyState with _$PinVerifyState {
  const factory PinVerifyState({
    @Default(false) bool biometricEnabled,
    @Default(RequestStatus<int>.idle()) RequestStatus<int> verify,
  }) = _PinVerifyState;
}
