import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/providers/input_stats_provider.dart';

class InputInfoSection extends ConsumerWidget {
  const InputInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(inputStatsProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          _infoChip("${stats.charCount} chars"),
          const SizedBox(width: 8),
          _infoChip("${stats.lineCount} lines"),
          const SizedBox(width: 8),
          _infoChip("${stats.byteCount} bytes"),
        ],
      ),
    );
  }

  Widget _infoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
