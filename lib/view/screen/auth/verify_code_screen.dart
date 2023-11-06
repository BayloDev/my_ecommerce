import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/view/widget/Auth/custom_elevated_button.dart';
import '../../../controller/auth/verify_code_controller.dart';
import '../../../core/class/handling_loading.dart';
import '../../../core/constant/colors.dart';
import '../../widget/CustomWidgets/custom_text_body_medium_black.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<VerifyCodeControllerImpl>(
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
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CustomTitleH1(text: 'Verify Code'),
                  ],
                ),
                const Spacer(),
                Center(
                  child: CustomTextBodyMediumBlack(
                    textAlign: TextAlign.center,
                    text:
                        'Please Enter The Digit Code Sent To Your Email Address : \n${controller.email}',
                  ),
                ),
                const SizedBox(height: 30),
                OtpTextField(
                  fieldWidth: 45,
                  borderRadius: BorderRadius.circular(16),
                  numberOfFields: 5,
                  borderColor: AppColor.black1,
                  showFieldAsBox: true,
                  focusedBorderColor: Colors.orange,
                  cursorColor: AppColor.secondaryColor,
                  onSubmit: (value) => controller.verifyCode(value),
                ),
                const SizedBox(height: 60),
                CustomElevatedButton(
                  text: 'Resend Code',
                  onPressed: () => controller.resendCode(),
                  color: AppColor.primaryColor,
                ),
                 const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
