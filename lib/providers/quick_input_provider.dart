import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuickInputNotifier extends StateNotifier<String> {
  QuickInputNotifier() : super("");

  void updateText(String value) {
    state = value;
  }

  void clear() {
    state = "";
  }

  void append(String value) {
    state = state + value;
  }
}

final quickInputProvider = StateNotifierProvider<QuickInputNotifier, String>((
  ref,
) {
  return QuickInputNotifier();
});
