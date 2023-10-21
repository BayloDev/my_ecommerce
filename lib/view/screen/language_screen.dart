import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/language_controller.dart';
import '../../core/constant/colors.dart';
import '../widget/Auth/custom_elevated_button.dart';
import '../widget/CustomWidgets/custom_title_h1.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LanguageController());
    return Scaffold(
      body: Center(
        child: GetBuilder<LanguageController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTitleH1(text: '1'.tr),
              const SizedBox(height: 24),
              CustomElevatedButton(
                text: '2'.tr,
                onPressed: () => controller.changeLang('ar'),
                width: 130,
                color: AppColor.primaryColor,
              ),
              const SizedBox(height: 2),
              CustomElevatedButton(
                text: '3'.tr,
                color: AppColor.primaryColor,
                onPressed: () => controller.changeLang('en'),
                width: 130,
              ),
              const SizedBox(height: 2),
              CustomElevatedButton(
                text: '4'.tr,
                color: AppColor.primaryColor,
                onPressed: () => controller.changeLang('fr'),
                width: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
