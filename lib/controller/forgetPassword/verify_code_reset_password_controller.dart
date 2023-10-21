import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/forgetPassword/verify_code_reset_password_data.dart';

abstract class VerifyCodeResetPassword extends GetxController {
  verifyCode(String code);
}

class VerifyCodeResetPasswordImpl extends VerifyCodeResetPassword {
  VerifyCodeResPassData verifyCodeResPassData =
      VerifyCodeResPassData(Get.find());
  late String email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  verifyCode(String code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResPassData.verifyCode(email, code);
    if (response is! StatusRequest) {
      if (response['status'] == 'success') {
        statusRequest = StatusRequest.success;
        Get.toNamed(AppRoutes.resetPassword, arguments: {'email': email});
      } else {
        statusRequest = StatusRequest.failure;
        customSnackBar(
          title: 'Wrong Code',
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
