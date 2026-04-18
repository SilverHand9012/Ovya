import 'package:flutter/material.dart';
import '../../l10n/gen/app_localizations.dart';
import '../models/sync_decision.dart';

class SyncConfirmationDialog extends StatelessWidget {
  final int pendingCount;

  const SyncConfirmationDialog({
    super.key,
    required this.pendingCount,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(SyncDecision.later);
      },
      child: AlertDialog(
        title: Text(loc.sync_dialog_title),
        content: Text(loc.sync_dialog_content(pendingCount.toString())),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(SyncDecision.discard),
            style: TextButton.styleFrom(iconColor: Colors.red, foregroundColor: Colors.red),
            child: Text(loc.discard),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(SyncDecision.later),
            child: Text(loc.later),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(SyncDecision.sync),
            child: Text(loc.syncNow),
          ),
        ],
      ),
    );
  }
}
