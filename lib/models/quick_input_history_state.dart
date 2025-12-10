class QuickInputHistoryState {
  final List<String> history;
  final int index;

  QuickInputHistoryState({required this.history, required this.index});

  String get text => history[index];

  bool get canUndo => index > 0;
  bool get canRedo => index < history.length - 1;
}
