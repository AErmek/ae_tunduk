import 'package:flutter/material.dart';

class PinPad extends StatefulWidget {
  const PinPad({super.key, required this.onCompleted, this.pinLength = 4});

  final void Function(String pin) onCompleted;
  final int pinLength;

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  String _pin = '';

  void _onDigit(String digit) {
    if (_pin.length >= widget.pinLength) return;
    setState(() => _pin += digit);
    if (_pin.length == widget.pinLength) {
      widget.onCompleted(_pin);
      setState(() => _pin = '');
    }
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PinDots(filled: _pin.length, total: widget.pinLength),
        const SizedBox(height: 32),
        _PinKeyboard(onDigit: _onDigit, onDelete: _onDelete),
      ],
    );
  }
}

class _PinDots extends StatelessWidget {
  const _PinDots({required this.filled, required this.total});

  final int filled;
  final int total;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i < filled ? color : color.withOpacity(0.2),
          ),
        );
      }),
    );
  }
}

class _PinKeyboard extends StatelessWidget {
  const _PinKeyboard({required this.onDigit, required this.onDelete});

  final void Function(String) onDigit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];

    return Column(
      children: keys.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((key) {
            if (key.isEmpty) return const SizedBox(width: 80, height: 80);
            return SizedBox(
              width: 80,
              height: 80,
              child: TextButton(
                onPressed: key == '⌫' ? onDelete : () => onDigit(key),
                child: Text(key, style: Theme.of(context).textTheme.headlineSmall),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
