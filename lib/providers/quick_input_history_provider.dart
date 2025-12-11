import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/models/quick_input_history_state.dart';

class QuickInputHistoryNotifier extends StateNotifier<QuickInputHistoryState> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;

  QuickInputHistoryNotifier()
    : super(QuickInputHistoryState(history: [''], index: 0)) {
    controller.text = "";
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final newText = controller.text;

    // 기존 타이머가 있으면 취소
    _debounce?.cancel();

    // 350ms debounce 후 히스토리에 저장
    _debounce = Timer(const Duration(milliseconds: 350), () {
      final trimmed = state.history.sublist(0, state.index + 1);

      if (trimmed.isNotEmpty && trimmed.last == newText) return;

      state = QuickInputHistoryState(
        history: [...trimmed, newText],
        index: trimmed.length,
      );
    });
  }

  void undo() {
    if (!state.canUndo) return;

    final newIndex = state.index - 1;
    state = QuickInputHistoryState(history: state.history, index: newIndex);

    controller.text = state.history[newIndex];
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  void redo() {
    if (!state.canRedo) return;

    final newIndex = state.index + 1;
    state = QuickInputHistoryState(history: state.history, index: newIndex);

    controller.text = state.history[newIndex];
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  void replaceText(String newText) {
    controller.text = newText;
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  void pushHistory(String text) {
    final trimmed = state.history.sublist(0, state.index + 1);
    if (trimmed.isNotEmpty && trimmed.last == text) return;

    state = QuickInputHistoryState(
      history: [...trimmed, text],
      index: trimmed.length,
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }
}

final quickInputHistoryProvider =
    StateNotifierProvider<QuickInputHistoryNotifier, QuickInputHistoryState>(
      (ref) => QuickInputHistoryNotifier(),
    );
