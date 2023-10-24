import 'package:flutter/material.dart';

class CustomTitleH1 extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;

  const CustomTitleH1({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
