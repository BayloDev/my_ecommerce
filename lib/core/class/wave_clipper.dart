import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.85);
    path.cubicTo(
      size.width * 0.5,
      size.height*1.25,
      size.width * 0.85,
      size.height * 0.5,
      size.width,
      size.height* 0.9,
    );
    path.lineTo(size.width, 1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}