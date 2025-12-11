// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FormatKit';

  @override
  String get home => 'Home';

  @override
  String get formats => 'Formats';

  @override
  String get history => 'History';

  @override
  String get settings => 'Settings';

  @override
  String get quickFormatInputHint => 'Enter or paste your text here';

  @override
  String chars(int chars) {
    return '$chars chars';
  }

  @override
  String lines(int lines) {
    return '$lines lines';
  }

  @override
  String bytes(int bytes) {
    return '$bytes bytes';
  }

  @override
  String get undoTooltip => 'Undo';

  @override
  String get redoTooltip => 'Redo';
}
