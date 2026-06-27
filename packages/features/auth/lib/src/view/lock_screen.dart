import 'package:feature_auth/src/blocs/pin_verify/pin_verify_bloc.dart';
import 'package:feature_auth/src/widgets/pin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) =>
        PinVerifyBloc(localAuth: GetIt.I(), setLockedStatus: GetIt.I())..add(const PinVerifyEvent.biometricRequested()),
    child: const _LockView(),
  );
}

class _LockView extends StatelessWidget {
  const _LockView();

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Scaffold(
      body: BlocBuilder<PinVerifyBloc, PinVerifyState>(
        builder: (context, state) => PinBody(
          title: 'CV-Scan',
          subtitle: 'Введите PIN-код',
          errorText: state.maybeWhen(error: (message) => message, orElse: () => null),
          onCompleted: (pin) => context.read<PinVerifyBloc>().add(PinVerifyEvent.pinSubmitted(pin)),
          footer: TextButton.icon(
            onPressed: () => context.read<PinVerifyBloc>().add(const PinVerifyEvent.biometricRequested()),
            icon: const Icon(Icons.fingerprint),
            label: const Text('Войти по биометрии'),
          ),
        ),
      ),
    ),
  );
}
