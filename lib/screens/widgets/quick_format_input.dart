import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/providers/quick_input_provider.dart';

class QuickFormatInput extends ConsumerWidget {
  const QuickFormatInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        decoration: const InputDecoration(
          hintText: "여기에 텍스트를 입력하거나 붙여넣기 하세요",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          ref.read(quickInputProvider.notifier).updateText(value);
        },
      ),
    );
  }
}
