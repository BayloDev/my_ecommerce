import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetPassword/check_email_controller.dart';
import '../../../core/class/handling_loading.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/routes.dart';
import '../../widget/Auth/custom_elevated_button.dart';
import '../../widget/Auth/custom_text_form_field.dart';
import '../../widget/CustomWidgets/custom_text_body_medium_black.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CheckEmailControllerImpl>(
          builder: (controller) => HandlingLoading(
            statusRequest: controller.statusRequest,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAllNamed(AppRoutes.signIn),
                      child: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 10),
                     const CustomTitleH1(text: 'Check Email',),
                  ],
                ),
                const SizedBox(height: 40),
                const Center(
                  child: CustomTextBodyMediumBlack(
                    textAlign: TextAlign.center,
                    text:
                        'Please enter the email address you used \nwhen you joined the first time',
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: controller.formKey,
                  child: Obx(
                    () => CustomTextFormField(
                      controller: controller.emailController,
                      fillColor: controller.isEmailValid.value
                          ? AppColor.greenLight
                          : AppColor.black7,
                      borderSideColor: controller.isEmailValid.value
                          ? AppColor.black5
                          : AppColor.black4,
                      validator: (newVal) {
                        return controller.validInput(newVal ?? '', 6, 50);
                      },
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'Check',
                  onPressed: () => controller.checkEmail(),
                  color: AppColor.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
