import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final bool isSecured;
  final TextEditingController controller;
  final String? hintText;
  final int? maxLine;

  const InputField({
    super.key,
    required this.title,
    required this.isSecured,
    required this.controller,
    this.hintText,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.transparent, width: 0),
          color: const Color.fromARGB(255, 241, 241, 241),
        ),
        child: TextField(
          controller: controller,
          obscureText: isSecured,
          maxLines: maxLine,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText ?? title,
              hintStyle: const TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
