import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/providers/quick_input_actions_provider.dart';

class QuickFormatActions extends ConsumerWidget {
  const QuickFormatActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.read(quickInputActionsProvider.notifier);

    return Row(
      children: [
        _buildButton(context, Icons.paste, actions.paste),
        const SizedBox(width: 12),
        _buildButton(context, Icons.clear, actions.clear),
        const SizedBox(width: 12),
        _buildButton(context, Icons.text_format, actions.format),
      ],
    );
  }
}

Widget _buildButton(BuildContext context, IconData icon, VoidCallback onTap) {
  return Expanded(
    child: Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Icon(icon),
        ),
      ),
    ),
  );
}
