import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/models/input_stats.dart';
import 'quick_input_provider.dart';

final inputStatsProvider = Provider<InputStats>((ref) {
  final input = ref.watch(quickInputProvider);

  final charCount = input.length;
  final lineCount = input.isEmpty ? 0 : input.split('\n').length;
  final byteCount = utf8.encode(input).length;

  return InputStats(
    charCount: charCount,
    lineCount: lineCount,
    byteCount: byteCount,
  );
});
