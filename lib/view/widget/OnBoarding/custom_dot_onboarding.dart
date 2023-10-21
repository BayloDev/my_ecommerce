import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/colors.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImpl controller = Get.find();
    return GetX<OnBoardingControllerImpl>(
      builder: (_) => AnimatedContainer(
        margin: const EdgeInsets.only(right: 10),
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 8,
        width: controller.currentIndex.value == index ? 20 : 8,
      ),
    );
  }
}
