import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinBody extends StatefulWidget {
  const PinBody({
    required this.title,
    required this.subtitle,
    required this.onCompleted,
    required this.pinLength,
    super.key,
    this.errorText,
    this.footer,
    this.autofocus = true,
  });

  final String title;
  final String subtitle;
  final String? errorText;
  final void Function(String pin) onCompleted;
  final Widget? footer;
  final int pinLength;
  final bool autofocus;
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
      if (widget.autofocus) _focusNode.requestFocus();
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
    final theme = context.theme;

    final basePinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: theme.style((t) => t.bM, (c) => c.onSurface),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.divider),
        borderRadius: BorderRadius.circular(Ui.tokens.radius.lg),
      ),
    );

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: theme.style((t) => t.h2, (c) => c.onSurface)),
              const SizedBox(height: 8),
              Text(widget.subtitle, style: theme.style((t) => t.bM, (c) => c.onSurfaceMuted)),
              if (widget.errorText != null) ...[
                const SizedBox(height: 8),
                Text(widget.errorText!, style: theme.style((t) => t.bS, (c) => c.error)),
              ],
              const SizedBox(height: 40),
              Pinput(
                length: widget.pinLength,
                controller: _controller,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                obscureText: true,
                defaultPinTheme: basePinTheme,
                focusedPinTheme: basePinTheme.copyWith(
                  decoration: basePinTheme.decoration!.copyWith(
                    border: Border.all(color: theme.colors.primary, width: 2),
                  ),
                ),
                errorPinTheme: basePinTheme.copyWith(
                  decoration: basePinTheme.decoration!.copyWith(
                    border: Border.all(color: theme.colors.error, width: 2),
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
