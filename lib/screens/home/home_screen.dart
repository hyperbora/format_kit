import 'package:flutter/material.dart';
import 'package:format_kit/screens/home/widgets/input_info_section.dart';
import 'package:format_kit/screens/home/widgets/quick_format_input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          QuickFormatInput(),
          InputInfoSection(),
          SizedBox(height: 16),
          QuickFormatActions(),
        ],
      ),
    );
  }
}

class QuickFormatActions extends StatelessWidget {
  const QuickFormatActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _fakeButton("Paste")),
        const SizedBox(width: 12),
        Expanded(child: _fakeButton("Clear")),
        const SizedBox(width: 12),
        Expanded(child: _fakeButton("Format")),
      ],
    );
  }
}

// 🔧 임시 버튼 위젯 (스켈레톤용)
Widget _fakeButton(String text) {
  return Container(
    height: 44,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(text),
  );
}
