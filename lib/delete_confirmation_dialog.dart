import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const DeleteConfirmationDialog({super.key , required this.onCancel , required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Theme.of(context).cardColor.withValues(alpha: 0.95),
      title: Text(
        "Delete Todo?",
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        // Confirm Button (Check)
        IconButton(
          icon: const Icon(Icons.check_rounded),
          color: colorScheme.secondary,
          // iconSize: ,
          onPressed: onConfirm,
        ),
        
        // Cancel Button (X)
        IconButton(
          icon: const Icon(Icons.close_rounded),
          color: colorScheme.error,
          // iconSize: ,
          onPressed: onCancel,
        )
      ],
    );
  }
}