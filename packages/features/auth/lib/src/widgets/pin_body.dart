import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinBody extends StatefulWidget {
  const PinBody({
    required this.title,
    required this.subtitle,
    required this.onCompleted,
    super.key,
    this.errorText,
    this.footer,
    this.pinLength = 4,
  });

  final String title;
  final String subtitle;
  final String? errorText;
  final void Function(String pin) onCompleted;
  final Widget? footer;
  final int pinLength;

  @override
  State<PinBody> createState() => _PinBodyState();
}

class _PinBodyState extends State<PinBody> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void didUpdateWidget(PinBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorText != widget.errorText && widget.errorText != null) {
      _controller.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final basePinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: theme.textTheme.headlineSmall,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(widget.subtitle, style: theme.textTheme.bodyMedium),
              if (widget.errorText != null) ...[
                const SizedBox(height: 8),
                Text(widget.errorText!, style: TextStyle(color: theme.colorScheme.error)),
              ],
              const SizedBox(height: 40),
              Pinput(
                length: widget.pinLength,
                controller: _controller,
                focusNode: _focusNode,
                autofocus: true,
                obscureText: true,
                defaultPinTheme: basePinTheme,
                focusedPinTheme: basePinTheme.copyWith(
                  decoration: basePinTheme.decoration!.copyWith(
                    border: Border.all(color: theme.colorScheme.primary, width: 2),
                  ),
                ),
                errorPinTheme: basePinTheme.copyWith(
                  decoration: basePinTheme.decoration!.copyWith(
                    border: Border.all(color: theme.colorScheme.error, width: 2),
                  ),
                ),
                onCompleted: (pin) {
                  _controller.clear();
                  widget.onCompleted(pin);
                },
              ),
              if (widget.footer != null) ...[const SizedBox(height: 24), widget.footer!],
            ],
          ),
        ),
      ),
    );
  }
}
