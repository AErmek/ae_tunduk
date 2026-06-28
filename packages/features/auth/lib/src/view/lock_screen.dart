import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_auth/src/blocs/pin_verify/pin_verify_bloc.dart';
import 'package:feature_auth/src/widgets/pin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => PinVerifyBloc(localAuth: GetIt.I(), setLockedStatus: GetIt.I())..add(const PinVerifyEvent.started()),
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
          title: context.t.authPinTitle,
          subtitle: context.t.authPinSubtitle,
          pinLength: Config.i.app.pinCodeLength,
          autofocus: false,
          errorText: state.verify.failure?.message,
          onCompleted: (pin) => context.read<PinVerifyBloc>().add(PinVerifyEvent.pinSubmitted(pin)),
          footer: state.biometricEnabled
              ? TextButton.icon(
                  onPressed: () => context.read<PinVerifyBloc>().add(const PinVerifyEvent.biometricRequested()),
                  icon: Icon(AppIcons.fingerprint, size: Ui.tokens.lgIconsSize),
                  label: Text(context.t.authBiometricPrompt, style: context.theme.style((t) => t.bS, (c) => c.primary)),
                )
              : null,
        ),
      ),
    ),
  );
}
