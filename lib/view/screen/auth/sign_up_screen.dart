import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/functions/alert_exit_app.dart';
import '../../../controller/auth/sign_up_controller.dart';
import '../../../core/class/handling_loading.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/images.dart';
import '../../widget/Auth/custom_elevated_button.dart';
import '../../widget/Auth/custom_text_form_field.dart';
import '../../widget/CustomWidgets/custom_text_body_medium_black.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';
import '../../widget/CustomWidgets/custom_title_h2.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImpl());
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: alertExitApp,
        child: SafeArea(
          child: Container(
            color: AppColor.black7,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<SignUpControllerImpl>(
                builder: (controller) => HandlingLoading(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const CustomTitleH1(text: 'Sign Up'),
                      Image.asset(AppImageAsset.logoApp, height: 120),
                      const SizedBox(height: 8),
                      const CustomTitleH2(text: 'Email / Password'),
                      const SizedBox(height: 20),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Obx(
                              () => CustomTextFormField(
                                controller: controller.usernameController,
                                fillColor: controller.isUsernameValid.value
                                    ? AppColor.greenLight
                                    : AppColor.black7,
                                borderSideColor:
                                    controller.isUsernameValid.value
                                        ? AppColor.black5
                                        : AppColor.black4,
                                validator: (newVal) {
                                  return controller.validInput(
                                      newVal ?? '', 3, 20, 'username');
                                },
                                hintText: 'Username',
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icon(Icons.person_2_outlined,
                                    color: AppColor.black3),
                              ),
                            ),
                            const SizedBox(height: 14),
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
                                    color: AppColor.black3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => CustomElevatedButton(
                          width: double.infinity,
                          onPressed: () => controller.signUpEmailPassword(),
                          text: 'Sign Up',
                          color: controller.isEmailValid.value &&
                                  controller.isPasswordValid.value &&
                                  controller.isUsernameValid.value
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
                        onPressed: () => controller.signUpGoogle(),
                        color: AppColor.primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextBodyMediumBlack(
                            text: 'Already have an account ?',
                          ),
                          TextButton(
                            onPressed: () => controller.goToSignIn(),
                            child: const Text(
                              'Sign In ',
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
