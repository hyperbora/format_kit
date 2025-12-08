import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/l10n/app_localizations.dart';
import 'package:format_kit/providers/quick_input_provider.dart';

class QuickFormatInput extends ConsumerWidget {
  const QuickFormatInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        maxLines: 6,
        minLines: 4,
        decoration: InputDecoration(
          hintText: loc.quickFormatInputHint,
          border: InputBorder.none,
        ),
        onChanged: (value) {
          ref.read(quickInputProvider.notifier).updateText(value);
        },
      ),
    );
  }
}
