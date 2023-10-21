import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/data_source/static/static.dart';

abstract class OnBoardingController extends GetxController {
  continueFunc();
  getStarted();
  onPageChanged(int newIndex);
}

class OnBoardingControllerImpl extends OnBoardingController {
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  MyServices myServices = Get.find();
  @override
  continueFunc() async {
    if (currentIndex.value < onBoardingData.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      await myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoutes.signIn);
    }
  }

  @override
  getStarted() async {
    await myServices.sharedPreferences.setString('step', '1');
    Get.toNamed(AppRoutes.signIn);
  }

  @override
  onPageChanged(int newIndex) {
    currentIndex.value = newIndex;
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
