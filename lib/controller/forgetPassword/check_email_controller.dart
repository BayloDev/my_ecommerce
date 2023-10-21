import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_dialog.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/forgetPassword/check_email_data.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
}

class CheckEmailControllerImpl extends CheckEmailController {
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isEmailValid = false.obs;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.checkEmail(emailController.text);
      if (response is! StatusRequest) {
        if (response['status'] == 'success') {
          statusRequest = StatusRequest.success;
          customSnackBar(
            title: 'Email Verification',
            message: 'A Verification Code Has Been Sent To Your Email Address',
            success: true,
          );
          Get.toNamed(
            AppRoutes.verifyCodeResPass,
            arguments: {'email': emailController.text},
          );
        } else if ((response['message'] == 'user not found')) {
          statusRequest = StatusRequest.failure;
          customDialog(
            Colors.red,
            'No Account Found',
            'Check Your Email And Try Again',
          );
        } else {
          statusRequest = StatusRequest.failure;
          customDialog(
            Colors.red,
            'Verification Code Error',
            'We Couldn\'t Send A Verification Code To Your Email Address, Please Try Again Later',
          );
        }
      } else {
        statusRequest = response;
      }
      update();
    }
  }

  validInput(String newVal, int min, int max) {
    if (newVal.isEmpty) {
      return "Can't be Empty";
    }
   if (newVal.contains('||') || newVal.contains('&&')) {
      return "Don't use || and && ";
    }
    if (newVal.length < min) {
      return "Can't be less than $min";
    }

    if (newVal.length > max) {
      return "Can't be larger than $max";
    }

    if (GetUtils.isEmail(newVal)) {
      Future.delayed(Duration.zero, () => isEmailValid.value = true);
    } else {
      Future.delayed(Duration.zero, () => isEmailValid.value = false);
      return "Invalid email";
    }
  }
}
