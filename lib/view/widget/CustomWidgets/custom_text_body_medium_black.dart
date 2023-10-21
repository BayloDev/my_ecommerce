import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/theme.dart';

class CustomTextBodyMediumBlack extends StatelessWidget {
  const CustomTextBodyMediumBlack({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: appTheme.textTheme.bodyMedium!.copyWith(color: AppColor.black2),
      textAlign: textAlign,
    );
  }
}
