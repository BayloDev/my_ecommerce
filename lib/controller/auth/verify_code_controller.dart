import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/verify_code_sign_up_data.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCode(String code);
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  String? email;
  late String? token;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
    });
    super.onInit();
  }

  @override
  verifyCode(String code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.verifyCode(email!, code);
    if (response is! StatusRequest) {
      if (response['status'] == 'success') {
        statusRequest = StatusRequest.success;
        myServices.sharedPreferences
            .setString('id', response['data']['user_id'].toString());
        myServices.sharedPreferences
            .setString('username', response['data']['user_name']);
        myServices.sharedPreferences
            .setString('email', response['data']['user_email']);
        myServices.sharedPreferences.setString('step', '2');
        token != null
            ? myServices.sharedPreferences.setString('token', token.toString())
            : null;
        Get.offAllNamed(AppRoutes.homePage);
        customSnackBar(
          title: 'SignUp Success',
          message: 'Welcome To Our Community',
          success: true,
        );
      } else {
        statusRequest = StatusRequest.failure;
        customSnackBar(
          title: 'SignUp Failed',
          message: 'The Code You Entered Is Incorrect',
          success: false,
        );
      }
    } else {
      statusRequest = response;
    }
    update();
  }
}
