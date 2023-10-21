// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constant/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color color;
  Widget? icon = Container();
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.width = double.infinity,
    this.icon,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: onPressed,
        icon: icon ?? Container(),
        label: Text(
          text,
          style: appTheme.textTheme.titleMedium!.copyWith(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
