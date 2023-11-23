import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handling_loading.dart';

import '../../../controller/auth/sign_in_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/images.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../widget/Auth/custom_elevated_button.dart';
import '../../widget/Auth/custom_text_form_field.dart';
import '../../widget/CustomWidgets/custom_text_body_medium_black.dart';
import '../../widget/CustomWidgets/custom_text_button.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';
import '../../widget/CustomWidgets/custom_title_h2.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImpl());
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: alertExitApp,
        child: SafeArea(
          child: Container(
            color: Colors.black.withOpacity(0.02),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<SignInControllerImpl>(
                builder: (controller) => HandlingLoading(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const CustomTitleH1(text: 'Sign In'),
                      Image.asset(AppImageAsset.logoApp, height: 120),
                      const SizedBox(height: 8),
                      const CustomTitleH2(text: 'Email / Password'),
                      const SizedBox(height: 25),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Obx(
                              () => CustomTextFormField(
                                controller: controller.emailController,
                                fillColor: controller.isEmailValid.value
                                    ? AppColor.greenLight
                                    : AppColor.black7,
                                borderSideColor: controller.isEmailValid.value
                                    ? AppColor.black5
                                    : AppColor.black4,
                                validator: (newVal) {
                                  return controller.validInput(
                                      newVal ?? '', 6, 50, 'email');
                                },
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: AppColor.black3),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Obx(
                              () => CustomTextFormField(
                                obscureText: !controller.showPass.value,
                                controller: controller.passwordController,
                                fillColor: controller.isPasswordValid.value
                                    ? AppColor.greenLight
                                    : AppColor.black7,
                                borderSideColor:
                                    controller.isPasswordValid.value
                                        ? AppColor.black5
                                        : AppColor.black4,
                                validator: (newVal) {
                                  return controller.validInput(
                                      newVal ?? '', 8, 50, 'password');
                                },
                                hintText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: Icon(Icons.lock_outlined,
                                    color: AppColor.black3),
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      CustomTextButton(
                        onPressed: () => controller.goToForgotPassword(),
                        child: const CustomTextBodyMediumBlack(
                            text: 'Forgot Password?'),
                      ),
                      Obx(
                        () => CustomElevatedButton(
                          width: double.infinity,
                          onPressed: () =>
                              controller.signInWithEmailAndPassword(),
                          text: 'Sign In',
                          color: controller.isEmailValid.value &&
                                  controller.isPasswordValid.value
                              ? AppColor.secondaryColor
                              : AppColor.black6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 1.7,
                              color: AppColor.black4,
                            ),
                          ),
                          const CustomTextBodyMediumBlack(text: 'Or'),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 1.7,
                              color: AppColor.black4,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomElevatedButton(
                        width: 20,
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            AppImageAsset.logoGoogle,
                            alignment: Alignment.center,
                            width: 24,
                          ),
                        ),
                        text: 'Continue with google',
                        onPressed: () => controller.signInGoogle(),
                        color: AppColor.primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextBodyMediumBlack(
                            text: 'Don\'t have an account ?',
                          ),
                          TextButton(
                            onPressed: () => controller.goToSignUp(),
                            child: const Text(
                              'Sign Up ',
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
