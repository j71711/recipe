import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//!________________
class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
  });
  final String title;
  final String? hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title),
        Gap(8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint ?? "enter text here",
          ),
          onTapOutside: (value) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
    );
  }
}
