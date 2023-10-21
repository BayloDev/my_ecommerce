import 'package:flutter/material.dart';

import '../../../core/constant/theme.dart';

class CustomTitleH1 extends StatelessWidget {
  final String text;

  const CustomTitleH1({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: appTheme.textTheme.titleLarge,
    );
  }
}
