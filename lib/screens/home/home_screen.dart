import 'package:flutter/material.dart';
import 'package:format_kit/screens/home/widgets/input_info_section.dart';
import 'package:format_kit/screens/home/widgets/quick_format_actions.dart';
import 'package:format_kit/screens/home/widgets/quick_format_input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          Expanded(child: QuickFormatInput()),
          SizedBox(height: 12),
          InputInfoSection(),
          SizedBox(height: 16),
          QuickFormatActions(),
        ],
      ),
    );
  }
}
