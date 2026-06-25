import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/src/widgets/pin_pad.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  final _pinService = GetIt.I<PinService>();
  final _setAuthenticated = GetIt.I<SetAuthenticatedUseCase>();
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    if (!await _pinService.isBiometricEnabled()) return;
    final ok = await _pinService.authenticateWithBiometric();
    if (ok && mounted) await _unlock();
  }

  Future<void> _onPin(String pin) async {
    final ok = await _pinService.verifyPin(pin);
    if (!mounted) return;
    if (ok) {
      await _unlock();
    } else {
      setState(() => _error = true);
    }
  }

  Future<void> _unlock() => _setAuthenticated();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('CV-Scan', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Введите PIN-код', style: Theme.of(context).textTheme.bodyMedium),
            if (_error) ...[
              const SizedBox(height: 8),
              Text('Неверный PIN', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
            const SizedBox(height: 40),
            PinPad(onCompleted: _onPin),
            const SizedBox(height: 24),
            FutureBuilder(
              future: _pinService.isBiometricEnabled(),
              builder: (context, snap) {
                if (snap.data != true) return const SizedBox.shrink();
                return TextButton.icon(
                  onPressed: _tryBiometric,
                  icon: const Icon(Icons.fingerprint),
                  label: const Text('Войти по биометрии'),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
