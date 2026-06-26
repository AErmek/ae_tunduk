import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_setup_bloc.freezed.dart';
part 'pin_setup_event.dart';
part 'pin_setup_state.dart';

class PinSetupBloc extends Bloc<PinSetupEvent, PinSetupState> {
  PinSetupBloc({required this._localAuth, required this._setAuthenticated})
    : super(const PinSetupState.awaitingFirst()) {
    on<PinSetupEvent>(
      (event, emit) => switch (event) {
        _PinSubmitted() => _onPinSubmitted(event, emit),
        _BiometricDecided() => _onBiometricDecided(event, emit),
      },
    );
  }

  final LocalAuthService _localAuth;
  final SetAuthenticatedUseCase _setAuthenticated;

  String? _firstPin;
  String? _confirmedPin;

  Future<void> _onPinSubmitted(_PinSubmitted event, Emitter<PinSetupState> emit) async {
    if (_firstPin == null) {
      _firstPin = event.pin;
      emit(const PinSetupState.awaitingConfirmation());
      return;
    }

    if (event.pin != _firstPin) {
      _firstPin = null;
      emit(const PinSetupState.mismatch());
      return;
    }

    _confirmedPin = event.pin;
    _firstPin = null;

    final canBio = await _localAuth.canUseBiometric();
    if (canBio) {
      emit(const PinSetupState.biometricPrompt());
    } else {
      await _setAuthenticated(pin: _confirmedPin!);
    }
  }

  Future<void> _onBiometricDecided(_BiometricDecided event, Emitter<PinSetupState> emit) async {
    if (event.enabled) await _localAuth.enableBiometric();
    await _setAuthenticated(pin: _confirmedPin!);
  }
}
