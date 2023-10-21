import 'package:flutter/material.dart';

import 'colors.dart';

late ThemeData appTheme;

ThemeData latinTheme = ThemeData(
  primarySwatch: Colors.orange,
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.black3,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    bodyLarge: TextStyle(
      color: AppColor.black2,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: AppColor.black1,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColor.black1,
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData arabicTheme = ThemeData(
  primarySwatch: Colors.orange,
  fontFamily: "Cairo",
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.black1,
    ),
    bodyLarge: TextStyle(
      color: AppColor.black2,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      color: AppColor.white,
    ),
    bodySmall: const TextStyle(
      color: AppColor.white,
    ),
  ),
);
