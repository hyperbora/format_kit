import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/models/input_stats.dart';
import 'package:format_kit/providers/quick_input_history_provider.dart';

final inputStatsProvider = Provider<InputStats>((ref) {
  final state = ref.watch(quickInputHistoryProvider);
  final text = state.text;

  final charCount = text.length;
  final lineCount = text.isEmpty ? 0 : text.split('\n').length;
  final byteCount = utf8.encode(text).length;

  return InputStats(
    charCount: charCount,
    lineCount: lineCount,
    byteCount: byteCount,
  );
});
