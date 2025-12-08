import 'package:flutter/material.dart';

class QuickFormatInput extends StatefulWidget {
  const QuickFormatInput({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  State<QuickFormatInput> createState() => _QuickFormatInputState();
}

class _QuickFormatInputState extends State<QuickFormatInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: _controller,
        maxLines: 6,
        minLines: 4,
        decoration: const InputDecoration(
          hintText: "여기에 텍스트를 입력하거나 붙여넣기 하세요",
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
