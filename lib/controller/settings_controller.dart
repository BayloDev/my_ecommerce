import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/core/services/services.dart';

class SettingsController extends GetxController {
  logOut() {}
}

class SettingsControllerImpl extends SettingsController {
  MyServices myServices = Get.find();
  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.signIn);
  }
}
