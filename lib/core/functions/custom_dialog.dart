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
      Container(
        color: Colors.white,
        height: 27,
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () => Get.back(),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
          ),
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
