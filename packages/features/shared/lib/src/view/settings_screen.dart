import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.t.settingsLogoutConfirmTitle),
        content: Text(dialogContext.t.settingsLogoutConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(dialogContext.t.settingsLogoutConfirmCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(dialogContext.t.settingsLogoutConfirmConfirm),
          ),
        ],
      ),
    );

    if (confirmed ?? false) await GetIt.I<LogoutUseCase>()();
  }

  Future<void> _simulateConflict(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final strings = context.t;

    final changed = await GetIt.I<SimulateServerConflictUseCase>()();

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          changed > 0 ? strings.settingsSimulateConflictDone(changed) : strings.settingsSimulateConflictNone,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.t.settingsTitle)),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (Config.i.testing.simulateServerConflict)
            ListTile(
              leading: const Icon(Icons.cloud_sync_outlined),
              title: Text(context.t.settingsSimulateConflict),
              onTap: () => _simulateConflict(context),
            ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.t.settingsLogout),
            textColor: context.themeColors.error,
            iconColor: context.themeColors.error,
            onTap: () => _confirmLogout(context),
          ),
        ],
      ),
    ),
  );
}
