import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';

bool isAlphabet() {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('langCode') == 'en' ||
      myServices.sharedPreferences.getString('langCode') == 'fr') {
    return true;
  } else {
    return false;
  }
}
