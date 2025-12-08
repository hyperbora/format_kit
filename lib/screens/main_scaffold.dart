import 'package:flutter/material.dart';
import 'package:format_kit/l10n/app_localizations.dart';
import 'package:format_kit/screens/formats_screen.dart';
import 'package:format_kit/screens/history_screen.dart';
import 'package:format_kit/screens/home_screen.dart';
import 'package:format_kit/screens/settings_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final _screens = const [
    HomeScreen(),
    FormatsScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final screenTitles = [loc.home, loc.formats, loc.history, loc.settings];

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitles[_selectedIndex]),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: loc.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_shapes),
              label: loc.formats,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: loc.history,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: loc.settings,
            ),
          ],
        ),
      ),
    );
  }
}
