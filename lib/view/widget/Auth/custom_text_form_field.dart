import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final Color borderSideColor;
  final Color fillColor;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.onTap,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    required this.hintText,
    required this.borderSideColor,
    required this.fillColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(" ")),
      ],
      obscureText: obscureText,
      strutStyle: const StrutStyle(height: 1),
      cursorColor: AppColor.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      style: appTheme.textTheme.bodySmall,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        enabled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: appTheme.textTheme.bodySmall!.copyWith(
          color: Colors.black54,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
