import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/src/widgets/pin_pad.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SetupPinPage extends StatefulWidget {
  const SetupPinPage({super.key});

  @override
  State<SetupPinPage> createState() => _SetupPinPageState();
}

class _SetupPinPageState extends State<SetupPinPage> {
  final _pinService = GetIt.I<PinService>();
  final _setAuthenticated = GetIt.I<SetAuthenticatedUseCase>();

  String? _firstPin;
  bool _mismatch = false;

  Future<void> _onPin(String pin) async {
    if (_firstPin == null) {
      setState(() {
        _firstPin = pin;
        _mismatch = false;
      });
      return;
    }

    if (pin != _firstPin) {
      setState(() {
        _firstPin = null;
        _mismatch = true;
      });
      return;
    }

    await _pinService.savePin(pin);

    final canBio = await _pinService.canUseBiometric();
    if (canBio && mounted) {
      final enable = await _showBiometricDialog();
      if (enable) await _pinService.enableBiometric();
    }

    if (mounted) await _setAuthenticated();
  }

  Future<bool> _showBiometricDialog() async =>
      await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Биометрия'),
          content: const Text('Использовать биометрию для входа?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Нет')),
            FilledButton(onPressed: () => Navigator.of(ctx).pop(true), child: const Text('Да')),
          ],
        ),
      ) ??
      false;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('CV-Scan', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              _firstPin == null ? 'Создайте PIN-код' : 'Повторите PIN-код',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (_mismatch) ...[
              const SizedBox(height: 8),
              Text('PIN не совпадает, попробуйте снова', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
            const SizedBox(height: 40),
            PinPad(onCompleted: _onPin),
          ],
        ),
      ),
    ),
  );
}
