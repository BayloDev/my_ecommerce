import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_dialog.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/forgetPassword/reset_password_data.dart';

abstract class ResetPasswordController extends GetxController {
  changePassword();
  validPassword(String newVal, int min, int max);
  validConfirmPass();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isPasswordValid = false.obs;
  RxBool showPass = false.obs;
  RxBool isMatch = false.obs;
  late String email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  changePassword() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.resetPasswordData(
        email,
        md5.convert(utf8.encode(passwordController.text)).toString(),
      );
      if (response is! StatusRequest) {
        if (response['status'] == 'success') {
          statusRequest = StatusRequest.success;
          Get.offAllNamed(AppRoutes.signIn);
          customSnackBar(
            title: 'Success',
            message:
                'Your Password Has Been Change Successfully, Please SignIn again',
            success: true,
          );
        } else {
          statusRequest = StatusRequest.failure;
          customDialog(
            Colors.orange,
            'Warnnig',
            'You Entered The Old Password, Please Enter Another To Make changes Or SignIn instead',
          );
        }
      } else {
        statusRequest = response;
      }
      update();
    }
  }

  @override
  validPassword(String newVal, int min, int max) {
    if (newVal.isEmpty) {
      return "Can't be Empty";
    }
    if (newVal.contains('||') || newVal.contains('&&')) {
      Future.delayed(Duration.zero, () => isPasswordValid.value = false);
      return "Don't use || and && ";
    }
    if (newVal.length < min) {
      Future.delayed(Duration.zero, () => isPasswordValid.value = false);
      return "Can't be less than $min";
    }
    if (newVal.length > max) {
      Future.delayed(Duration.zero, () => isPasswordValid.value = false);
      return "Can't be larger than $max";
    }
    Future.delayed(Duration.zero, () => isPasswordValid.value = true);
  }

  @override
  validConfirmPass() {
    if (passwordController.text != confirmPasswordController.text) {
      Future.delayed(Duration.zero, () => isMatch.value = false);
      return 'Password does not match';
    } else {
      Future.delayed(Duration.zero, () => isMatch.value = true);
    }
  }
}
