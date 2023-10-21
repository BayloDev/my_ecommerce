import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar({
  required String title,
  required String message,
  required bool success,
}) =>
    GetSnackBar(
      duration: const Duration(seconds: 4),
      title: title,
      message: message,
      backgroundColor: success
          ? Colors.green.withOpacity(0.85)
          : Colors.red.withOpacity(0.8),
      borderRadius: 20,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    ).show();
