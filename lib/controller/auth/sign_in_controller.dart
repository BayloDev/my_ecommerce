import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_dialog.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/sign_in_data.dart';

abstract class SignInController extends GetxController {
  signInWithEmailAndPassword();
  signInGoogle();
  goToSignUp();
  goToForgotPassword();
}

class SignInControllerImpl extends SignInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final showPass = false.obs;
  late String? token;
  MyServices myServices = Get.find();
  final formKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  SignInData signInData = SignInData(Get.find());
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
    });
    super.onInit();
  }

  @override
  goToForgotPassword() => Get.toNamed(AppRoutes.checkEmail);

  @override
  goToSignUp() => Get.offAllNamed(AppRoutes.signUp);

  @override
  signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.signInData(
        emailController.text,
        md5.convert(utf8.encode(passwordController.text)).toString(),
      );
      if (response is! StatusRequest) {
        if (response['status'] == 'sign in success') {
          statusRequest = StatusRequest.success;
          myServices.sharedPreferences
              .setString('id', response['data']['user_id'].toString());
          myServices.sharedPreferences
              .setString('username', response['data']['user_name']);
          myServices.sharedPreferences
              .setString('email', response['data']['user_email']);
          myServices.sharedPreferences.setString('step', '2');
          token != null
              ? myServices.sharedPreferences
                  .setString('token', token.toString())
              : null;
          Get.offAllNamed(AppRoutes.homePage);
        } else {
          statusRequest = StatusRequest.failure;
          if (response['message'] == 'user not found') {
            statusRequest = StatusRequest.failure;
            customDialog(
              Colors.red,
              'User Not Found',
              'Please, Sign Up Instead',
            );
          } else if (response['message'] == 'wrong password') {
            customDialog(
              Colors.red,
              'Wrong Password',
              'The Password You Entered Is Incorrect',
            );
          } else if (response['message'] == 'code not sent') {
            customDialog(
              Colors.red,
              'Verification Code Error',
              'We Couldn\'t Send A Verification Code To Your Email Address, Please Try Again Later',
            );
          } else {
            customSnackBar(
              title: 'Email Verification',
              message:
                  'A Verification Code Has Been Sent To Your Email Address',
              success: true,
            );
            Get.toNamed(
              AppRoutes.verifyCode,
              arguments: {'email': emailController.text},
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
  signInGoogle() {}

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
    if (inputType == 'email' && isEmailValid.value) {
      Future.delayed(Duration.zero, () => isEmailValid.value = false);
    }
    if (inputType == 'password' && isPasswordValid.value) {
      Future.delayed(Duration.zero, () => isPasswordValid.value = false);
    }
  }
}
