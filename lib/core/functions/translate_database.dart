import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';

String translateDatabase(String ar, String en, String fr) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString('langCode') == 'en') {
    return en;
  } else if (myServices.sharedPreferences.getString('langCode') == 'fr') {
    return fr;
  } else {
    return ar;
  }
}
