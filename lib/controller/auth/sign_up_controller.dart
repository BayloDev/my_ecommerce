import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_dialog.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/auth/sign_up_data.dart';

abstract class SignUpController extends GetxController {
  signUpEmailPassword();
  signUpGoogle();
  goToSignIn();
  goToForgotPassword();
}

class SignUpControllerImpl extends SignUpController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final showPass = false.obs;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());

  @override
  goToForgotPassword() => Get.toNamed(AppRoutes.checkEmail);

  @override
  goToSignIn() => Get.offAllNamed(AppRoutes.signIn);

  @override
  signUpEmailPassword() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.signUpData(
        usernameController.text,
        emailController.text,
        md5.convert(utf8.encode(passwordController.text)).toString(),
      );
      if (response is! StatusRequest) {
        if (response['status'] == 'success') {
          statusRequest = StatusRequest.success;
          customSnackBar(
            title: 'Email Verification',
            message: 'A Verification Code Has Been Sent To Your Email Address',
            success: true,
          );
          Get.toNamed(
            AppRoutes.verifyCode,
            arguments: {'email': emailController.text},
          );
        } else {
          statusRequest = StatusRequest.failure;
          if (response['message'] == 'email already exists') {
            customDialog(
              Colors.red,
              'Email Warning',
              'Email Already Exists, Please SignIn Instead',
            );
          } else {
            customDialog(
              Colors.red,
              'Verification Code Error',
              'We Couldn\'t Send A Verification Code To Your Email Address, Please Try Again Later',
            );
          }
        }
      } else {
        statusRequest = response;
      }
      update();
    }
  }

  @override
  signUpGoogle() {}
  RxBool isUsernameValid = false.obs;
  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  validInput(String newVal, int min, int max, String inputType) {
    if (newVal.isEmpty) {
      return "Can't be Empty";
    }
   if (newVal.contains('||') || newVal.contains('&&')) {
      setFieldFalse(inputType);
      return "Don't use || and && ";
    }
    if (newVal.length < min) {
      setFieldFalse(inputType);
      return "Can't be less than $min";
    }

    if (newVal.length > max) {
      setFieldFalse(inputType);
      return "Can't be larger than $max";
    }
    switch (inputType) {
      case 'username':
        if (GetUtils.isUsername(newVal)) {
          Future.delayed(Duration.zero, () => isUsernameValid.value = true);
        } else {
          Future.delayed(Duration.zero, () => isUsernameValid.value = false);
          return "Invalid username";
        }
        break;
      case 'email':
        if (GetUtils.isEmail(newVal)) {
          Future.delayed(Duration.zero, () => isEmailValid.value = true);
        } else {
          Future.delayed(Duration.zero, () => isEmailValid.value = false);
          return "Invalid email";
        }
        break;
      case 'password':
        Future.delayed(Duration.zero, () => isPasswordValid.value = true);
        break;
      default:
    }
  }

  void setFieldFalse(String inputType) {
    if (inputType == 'username' && isUsernameValid.value) {
      Future.delayed(Duration.zero, () => isUsernameValid.value = false);
    }
    if (inputType == 'email' && isEmailValid.value) {
      Future.delayed(Duration.zero, () => isEmailValid.value = false);
    }
    if (inputType == 'password' && isPasswordValid.value) {
      Future.delayed(Duration.zero, () => isPasswordValid.value = false);
    }
  }
}
