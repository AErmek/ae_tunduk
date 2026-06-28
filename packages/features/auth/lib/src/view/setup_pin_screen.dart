import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_auth/src/blocs/pin_setup/pin_setup_bloc.dart';
import 'package:feature_auth/src/widgets/pin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SetupPinScreen extends StatelessWidget {
  const SetupPinScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => PinSetupBloc(localAuth: GetIt.I(), setAuthenticated: GetIt.I()),
    child: const _SetupPinView(),
  );
}

class _SetupPinView extends StatelessWidget {
  const _SetupPinView();

  @override
  Widget build(BuildContext context) => BlocConsumer<PinSetupBloc, PinSetupState>(
    listenWhen: (_, current) => current.maybeMap(biometricPrompt: (_) => true, orElse: () => false),
    listener: (context, state) async {
      final enable = await _showBiometricDialog(context);
      if (context.mounted) {
        context.read<PinSetupBloc>().add(PinSetupEvent.biometricDecided(enabled: enable));
      }
    },
    builder: (context, state) => Scaffold(
      body: PinBody(
        title: context.t.appTitle,
        autofocus: true,
        pinLength: Config.i.app.pinCodeLength,
        subtitle: state.maybeWhen(
          awaitingConfirmation: () => context.t.confirmPinTitle,
          orElse: () => context.t.createPinTitle,
        ),
        errorText: state.maybeWhen(mismatch: () => context.t.pinMismatchError, orElse: () => null),
        onCompleted: (pin) => context.read<PinSetupBloc>().add(PinSetupEvent.pinSubmitted(pin)),
      ),
    ),
  );

  Future<bool> _showBiometricDialog(BuildContext context) async =>
      await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(context.t.authBiometricTitle),
          content: Text(context.t.authBiometricSubtitle),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text(context.t.no)),
            FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text(context.t.yes)),
          ],
        ),
      ) ??
      false;
}
