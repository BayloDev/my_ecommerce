import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/data_source/static/static.dart';
import '../CustomWidgets/custom_text_body_medium_black.dart';
import '../CustomWidgets/custom_title_h1.dart';

class CustomPageView extends GetView<OnBoardingControllerImpl> {
  const CustomPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: onBoardingData.length,
        onPageChanged: (value) => controller.onPageChanged(value),
        itemBuilder: (context, index) => Column(
          children: [
            CustomTitleH1(text: onBoardingData[index].title),
            const SizedBox(height: 50),
            Image.asset(
              onBoardingData[index].imageUrl,
              width: 200,
            ),
            const SizedBox(height: 50),
            CustomTextBodyMediumBlack(text: onBoardingData[index].body)
          ],
        ),
      ),
    );
  }
}
