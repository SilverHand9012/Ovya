import 'package:flutter/material.dart';
import '../../l10n/gen/app_localizations.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final int pendingCount;

  const LogoutConfirmationDialog({
    super.key,
    required this.pendingCount,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    
    return AlertDialog(
      title: Text(loc.logout_dialog_title),
      content: Text(loc.logout_dialog_content(pendingCount.toString())),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: TextButton.styleFrom(iconColor: Colors.red, foregroundColor: Colors.red),
          child: Text(loc.logout_dialog_confirm),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(loc.logout_dialog_stay),
        ),
      ],
    );
  }
}
