import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidate_detail/src/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Tappable contact rows that hand off to the platform (dialer, mail, Telegram).
class ContactsSection extends StatelessWidget {
  const ContactsSection({required this.candidate, super.key});

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[
      if (candidate.email case final email?)
        _ContactRow(icon: Icons.email_outlined, value: email, uri: 'mailto:$email'),
      if (candidate.phone case final phone?) _ContactRow(icon: Icons.phone_outlined, value: phone, uri: 'tel:$phone'),
      if (candidate.tg case final tg?)
        _ContactRow(icon: Icons.send_outlined, value: tg, uri: 'https://t.me/${tg.replaceFirst('@', '')}'),
      if (candidate.city case final city?) _ContactRow(icon: Icons.location_on_outlined, value: city),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();

    return InfoSection(
      title: context.t.candidateDetailContacts,
      child: Column(children: rows),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.value, this.uri});

  final IconData icon;
  final String value;
  final String? uri;

  Future<void> _open() async {
    final target = uri;
    if (target == null) return;
    final parsed = Uri.parse(target);
    if (await canLaunchUrl(parsed)) await launchUrl(parsed, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: uri == null ? null : _open,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 12),
            Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
            if (uri != null) Icon(Icons.chevron_right, size: 20, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
