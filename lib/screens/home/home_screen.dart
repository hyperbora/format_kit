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
          SizedBox(height: 24),
          FormatTypeSelector(),
          SizedBox(height: 24),
          FormatPreviewCard(),
          SizedBox(height: 24),
          RecentHistorySection(),
          SizedBox(height: 24),
          FavoriteFormatsSection(),
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

class FormatTypeSelector extends StatelessWidget {
  const FormatTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: _boxDecoration(),
      alignment: Alignment.centerLeft,
      child: const Text("포맷 타입 선택 (가로 스크롤 예정)"),
    );
  }
}

class FormatPreviewCard extends StatelessWidget {
  const FormatPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: const Text("포매팅 결과 미리보기 (Preview 카드)"),
    );
  }
}

class RecentHistorySection extends StatelessWidget {
  const RecentHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: const Text("최근 포매팅 기록 섹션"),
    );
  }
}

class FavoriteFormatsSection extends StatelessWidget {
  const FavoriteFormatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: const Text("즐겨찾기 포맷 섹션"),
    );
  }
}

// 🔧 공통 데코레이션
BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade300),
  );
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
