import 'package:flutter/material.dart';

import '../../../core/constant/theme.dart';

class CustomTextBodyMediumWhite extends StatelessWidget {
  const CustomTextBodyMediumWhite({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: appTheme.textTheme.bodyMedium,
    );
  }
}
