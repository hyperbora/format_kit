// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '포맷킷';

  @override
  String get home => '홈';

  @override
  String get formats => '포맷';

  @override
  String get history => '기록';

  @override
  String get settings => '설정';

  @override
  String get quickFormatInputHint => '여기에 텍스트를 입력하거나 붙여넣기 하세요';

  @override
  String chars(int chars) {
    return '$chars 글자수';
  }

  @override
  String lines(int lines) {
    return '$lines 줄수';
  }

  @override
  String bytes(int bytes) {
    return '$bytes 바이트';
  }
}
