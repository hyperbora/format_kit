import 'package:flutter/material.dart';
import 'package:format_kit/screens/main_scaffold.dart';

class FormatKitApp extends StatelessWidget {
  const FormatKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormatKit',
      theme: ThemeData.light().copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1C1C1E),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MainScaffold(),
    );
  }
}
