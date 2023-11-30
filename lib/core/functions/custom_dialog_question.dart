import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

Future<dynamic> customDialogQuestion(void Function()? onDelete) {
  return Get.defaultDialog(
    titlePadding: const EdgeInsets.only(top: 16),
    contentPadding:
        const EdgeInsets.only(top: 16, bottom: 10, left: 16, right: 16),
    content: Text(
      'Are you sure you want to delete this item ?',
      style: TextStyle(
        color: AppColor.black3,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
    titleStyle: const TextStyle(color: Colors.orange, fontSize: 18,
        fontWeight: FontWeight.w700,
    ),
    backgroundColor: Colors.white.withOpacity(0.98),
    barrierDismissible: false,
    actions: [
      SizedBox(
        height: 27,
        child: ElevatedButton(
          onPressed: () => Get.back(),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 27,
        child: ElevatedButton(
          onPressed: onDelete,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red.shade300),
          ),
          child: const Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
