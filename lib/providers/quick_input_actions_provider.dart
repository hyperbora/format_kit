import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:format_kit/services/quick_format_service.dart';
import 'quick_input_history_provider.dart';

final quickInputActionsProvider = NotifierProvider<QuickInputActions, void>(
  QuickInputActions.new,
);

class QuickInputActions extends Notifier<void> {
  @override
  void build() {}

  QuickInputHistoryNotifier get _history =>
      ref.read(quickInputHistoryProvider.notifier);

  /// 📌 붙여넣기
  Future<void> paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text ?? "";

    _history.controller.text = text;
    _history.pushHistory(text);
  }

  /// 📌 입력 전체 삭제
  void clear() {
    _history.controller.text = "";
    _history.pushHistory("");
  }

  /// 📌 JSON 포매팅
  void format() {
    final input = _history.controller.text;

    final formatted = QuickFormatService.formatJson(input);
    if (formatted == null) {
      // 실패 → 에러 UI는 HomeScreen에서 처리
      return;
    }

    _history.controller.text = formatted;
    _history.pushHistory(formatted);
  }
}
