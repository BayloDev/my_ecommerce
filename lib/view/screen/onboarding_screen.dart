import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constant/colors.dart';
import '../../data/data_source/static/static.dart';
import '../widget/CustomWidgets/custom_text_body_medium_black.dart';
import '../widget/OnBoarding/custom_page_view.dart';
import '../widget/OnBoarding/custom_dot_onboarding.dart';
import '../widget/Auth/custom_elevated_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImpl controller = Get.put(OnBoardingControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const CustomPageView(),
              const SizedBox(height: 50),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        onBoardingData.length,
                        (index) => CustomDotOnBoarding(index: index),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () => controller.continueFunc(),
                    child: CustomTextBodyMediumBlack(text: '11'.tr),
                  ),
                  CustomElevatedButton(
                    color: AppColor.primaryColor,
                    onPressed: () => controller.getStarted(),
                    text: '12'.tr,
                    width: double.infinity,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
