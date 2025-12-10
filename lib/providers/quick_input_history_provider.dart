import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/models/quick_input_history_state.dart';

class QuickInputHistoryNotifier extends StateNotifier<QuickInputHistoryState> {
  final TextEditingController controller = TextEditingController();

  QuickInputHistoryNotifier()
    : super(QuickInputHistoryState(history: [''], index: 0)) {
    controller.text = "";
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final newText = controller.text;

    // 현재 index 뒤의 히스토리 제거 (redo stack 초기화)
    final trimmed = state.history.sublist(0, state.index + 1);

    // 동일 텍스트 반복 push 방지
    if (trimmed.isNotEmpty && trimmed.last == newText) return;

    state = QuickInputHistoryState(
      history: [...trimmed, newText],
      index: trimmed.length,
    );
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
}

final quickInputHistoryProvider =
    StateNotifierProvider<QuickInputHistoryNotifier, QuickInputHistoryState>(
      (ref) => QuickInputHistoryNotifier(),
    );
