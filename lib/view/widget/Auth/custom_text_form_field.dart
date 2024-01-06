import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
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
  final double? borderRadius;
  final double? fontSize;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.validator,
    this.borderRadius,
    this.fontSize,
    required this.hintText,
    required this.borderSideColor,
    required this.fillColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp("  ")),
      ],
      obscureText: obscureText,
      cursorHeight: 22,
      cursorColor: AppColor.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: 14,
        color: AppColor.black1,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        filled: true,
        enabled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderSideColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: TextStyle(
          fontSize: fontSize ?? 14,
          color: AppColor.black1,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
