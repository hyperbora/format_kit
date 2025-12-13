import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String message, {int seconds = 2}) {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    ),
  );
}
