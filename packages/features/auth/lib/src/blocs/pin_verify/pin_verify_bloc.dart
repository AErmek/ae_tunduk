import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_verify_bloc.freezed.dart';
part 'pin_verify_event.dart';
part 'pin_verify_state.dart';

class PinVerifyBloc extends Bloc<PinVerifyEvent, PinVerifyState> {
  PinVerifyBloc({required this._localAuth, required this._setLockedStatus})
    : super(const PinVerifyState.idle()) {
    on<PinVerifyEvent>(
      (event, emit) => switch (event) {
        _PinSubmitted() => _onPinSubmitted(event, emit),
        _BiometricRequested() => _onBiometricRequested(event, emit),
      },
    );
  }

  final LocalAuthServices _localAuth;
  final AuthSetLockedStatusUseCase _setLockedStatus;

  Future<void> _onPinSubmitted(_PinSubmitted event, Emitter<PinVerifyState> emit) async {
    emit(const PinVerifyState.loading());
    final ok = await _localAuth.verifyPin(event.pin);
    if (ok) {
      await _setLockedStatus(UserLockedStatus.unlocked);
    } else {
      emit(const PinVerifyState.error('Неверный PIN'));
    }
  }

  Future<void> _onBiometricRequested(_BiometricRequested event, Emitter<PinVerifyState> emit) async {
    emit(const PinVerifyState.loading());
    final enabled = await _localAuth.isBiometricEnabled();
    if (!enabled) {
      emit(const PinVerifyState.idle());
      return;
    }
    final ok = await _localAuth.authenticateWithBiometric();
    if (ok) {
      await _setLockedStatus(UserLockedStatus.unlocked);
    } else {
      emit(const PinVerifyState.idle());
    }
  }
}
