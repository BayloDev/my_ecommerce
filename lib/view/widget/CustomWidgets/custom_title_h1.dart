import 'package:flutter/material.dart';

class CustomTitleH1 extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTitleH1({
    super.key,
    required this.text,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
