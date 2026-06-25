import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/src/widgets/pin_pad.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LockOverlay extends StatefulWidget {
  const LockOverlay({required this.onUnlocked, super.key});

  final VoidCallback onUnlocked;

  @override
  State<LockOverlay> createState() => _LockOverlayState();
}

class _LockOverlayState extends State<LockOverlay> {
  final _pinService = GetIt.I<PinService>();
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _tryBiometric();
  }

  Future<void> _tryBiometric() async {
    if (!await _pinService.isBiometricEnabled()) return;
    final ok = await _pinService.authenticateWithBiometric();
    if (ok && mounted) widget.onUnlocked();
  }

  Future<void> _onPin(String pin) async {
    final ok = await _pinService.verifyPin(pin);
    if (!mounted) return;
    if (ok) {
      widget.onUnlocked();
    } else {
      setState(() => _error = true);
    }
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Theme.of(context).colorScheme.surface,
    child: SafeArea(
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
