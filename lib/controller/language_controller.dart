import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/constant/theme.dart';
import '../core/services/services.dart';

class LanguageController extends GetxController {
  late Locale language;
  MyServices myServices = Get.find();
  changeLang(String langCode) async {
    language = Locale(langCode);
    appTheme = langCode == 'ar' ? arabicTheme : latinTheme;
    await myServices.sharedPreferences.setString('langCode', langCode);
    await Get.updateLocale(language);
    Get.toNamed(AppRoutes.onBoarding);
  }

  @override
  void onInit() {
    String? langCodeSharedPref =
        myServices.sharedPreferences.getString('langCode');
    if (langCodeSharedPref == 'ar') {
      language = const Locale('ar');
      appTheme = arabicTheme;
    } else if (langCodeSharedPref == 'en') {
      language = const Locale('en');
      appTheme = latinTheme;
    } else if (langCodeSharedPref == 'fr') {
      language = const Locale('fr');
      appTheme = latinTheme;
    } else {
      language = Locale(Get.deviceLocale?.languageCode ?? 'en');
      appTheme =
          Get.deviceLocale?.languageCode == 'ar' ? arabicTheme : latinTheme;
    }
    super.onInit();
  }
}
