import 'package:flutter/material.dart';

class CustomTitleH3 extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTitleH3({
    super.key,
    required this.text,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
