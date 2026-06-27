import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'pin_verify_bloc.freezed.dart';
part 'pin_verify_event.dart';
part 'pin_verify_state.dart';

class PinVerifyBloc extends Bloc<PinVerifyEvent, PinVerifyState> {
  PinVerifyBloc({required this._localAuth, required this._setLockedStatus}) : super(const PinVerifyState()) {
    on<PinVerifyEvent>(
      (event, emit) => switch (event) {
        _Started() => _onStarted(event, emit),
        _PinSubmitted() => _onPinSubmitted(event, emit),
        _BiometricRequested() => _onBiometricRequested(event, emit),
      },
    );
  }

  final LocalAuthService _localAuth;
  final AuthSetLockedStatusUseCase _setLockedStatus;

  Future<void> _onStarted(_Started event, Emitter<PinVerifyState> emit) async {
    final enabled = await _localAuth.isBiometricEnabled();
    emit(state.copyWith(biometricEnabled: enabled));
    if (enabled) await _authenticateWithBiometric(emit);
  }

  Future<void> _onPinSubmitted(_PinSubmitted event, Emitter<PinVerifyState> emit) async {
    emit(state.copyWith(verify: const RequestStatus<int>.loading()));
    final ok = await _localAuth.verifyPin(event.pin);
    if (ok) {
      await _setLockedStatus(UserLockedStatus.unlocked);
    } else {
      emit(state.copyWith(verify: const RequestStatus<int>.fail(InvalidPinFailure())));
    }
  }

  Future<void> _onBiometricRequested(_BiometricRequested event, Emitter<PinVerifyState> emit) async {
    if (!state.biometricEnabled) return;
    await _authenticateWithBiometric(emit);
  }

  Future<void> _authenticateWithBiometric(Emitter<PinVerifyState> emit) async {
    emit(state.copyWith(verify: const RequestStatus<int>.loading()));
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final ok = await _localAuth.authenticateWithBiometric();
    if (ok) {
      await _setLockedStatus(UserLockedStatus.unlocked);
    } else {
      emit(state.copyWith(verify: const RequestStatus<int>.idle()));
    }
  }
}
