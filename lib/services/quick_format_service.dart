import 'dart:convert';

class QuickFormatService {
  static String? formatJson(String input) {
    try {
      final jsonObj = json.decode(input);
      return const JsonEncoder.withIndent("  ").convert(jsonObj);
    } catch (_) {
      return null;
    }
  }
}
