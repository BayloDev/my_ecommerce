import 'package:get/get.dart';

import '../core/services/services.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String? id;
  String? username;
  String? email;
  String? token;

  @override
  void onInit() {
    id = myServices.sharedPreferences.getString('id');
    username = myServices.sharedPreferences.getString('username');
    email = myServices.sharedPreferences.getString('email');
    token = myServices.sharedPreferences.getString('token');
    super.onInit();
  }
}
