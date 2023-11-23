import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_text_body_medium_black.dart';

import '../../../controller/forgetPassword/reset_password_controller.dart';
import '../../../core/class/handling_loading.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/routes.dart';
import '../../widget/Auth/custom_elevated_button.dart';
import '../../widget/Auth/custom_text_form_field.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<ResetPasswordControllerImpl>(
          builder: (controller) => HandlingLoading(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAllNamed(AppRoutes.signIn),
                      child: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 10),
                    const CustomTitleH1(text: 'Reset Password'),
                  ],
                ),
                const SizedBox(height: 100),
                const Center(
                  child: CustomTextBodyMediumBlack(
                    text: 'Please Enter The New Password',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Obx(
                        () => CustomTextFormField(
                          obscureText: !controller.showPass.value,
                          controller: controller.passwordController,
                          fillColor: controller.isPasswordValid.value
                              ? AppColor.greenLight
                              : AppColor.black7,
                          borderSideColor: controller.isPasswordValid.value
                              ? AppColor.black5
                              : AppColor.black4,
                          validator: (newVal) {
                            return controller.validPassword(
                                newVal ?? '', 8, 50);
                          },
                          hintText: 'New Password',
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icon(
                            Icons.lock_reset_outlined,
                            color: AppColor.black3,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => controller.showPass.value =
                                !controller.showPass.value,
                            child: Icon(
                                controller.showPass.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColor.black3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => CustomTextFormField(
                          obscureText: true,
                          controller: controller.confirmPasswordController,
                          fillColor: controller.isPasswordValid.value &&
                                  controller.isMatch.value
                              ? AppColor.greenLight
                              : AppColor.black7,
                          borderSideColor: controller.isPasswordValid.value &&
                                  controller.isMatch.value
                              ? AppColor.black5
                              : AppColor.black4,
                          validator: (newVal) {
                            return controller.validConfirmPass();
                          },
                          hintText: 'Confirm New Password',
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColor.black3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'Save',
                  onPressed: () => controller.changePassword(),
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
