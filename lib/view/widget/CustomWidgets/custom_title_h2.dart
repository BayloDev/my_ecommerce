import 'package:flutter/material.dart';

class CustomTitleH2 extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTitleH2({
    super.key,
    required this.text,
    this.color = Colors.black45,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
