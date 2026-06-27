import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidate_detail/src/widgets/info_section.dart';
import 'package:flutter/material.dart';

/// Free-form reviewer note. Submits only when the text actually changed, so an
/// untouched field never enqueues a no-op sync.
class NoteEditor extends StatefulWidget {
  const NoteEditor({required this.note, required this.onSubmit, this.saving = false, super.key});

  final String? note;
  final ValueChanged<String> onSubmit;
  final bool saving;

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late final TextEditingController _controller = TextEditingController(text: widget.note ?? '');

  @override
  void didUpdateWidget(NoteEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Adopt server/synced changes only while the field isn't being edited.
    if (widget.note != oldWidget.note && widget.note != _controller.text && !_focusNode.hasFocus) {
      _controller.text = widget.note ?? '';
    }
  }

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _dirty => _controller.text.trim() != (widget.note ?? '').trim();

  void _submit() {
    _focusNode.unfocus();
    widget.onSubmit(_controller.text.trim());
  }

  @override
  Widget build(BuildContext context) => InfoSection(
    title: context.t.candidateDetailNote,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          minLines: 3,
          maxLines: 6,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(hintText: context.t.candidateDetailNoteHint, border: const OutlineInputBorder()),
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: (_dirty && !widget.saving) ? _submit : null,
          icon: widget.saving
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.check, size: 18),
          label: Text(context.t.candidateDetailNoteSave),
        ),
      ],
    ),
  );
}
