import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

Future<dynamic> customDialog(Color color, String title, String content) {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.only(top: 16),
    contentPadding:
        const EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
    title: title,
    content: Text(
      content,
      style: TextStyle(
        color: AppColor.black3,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
    titleStyle: TextStyle(color: color, fontSize: 18),
    backgroundColor: Colors.white.withOpacity(0.92),
    barrierDismissible: false,
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: const Text(
          'Close',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
