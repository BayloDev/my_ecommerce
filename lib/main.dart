import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/view/screen/home/home_screen.dart';
import 'bindings/initial_binding.dart';
import 'controller/language_controller.dart';
import 'core/constant/theme.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguageController controller = Get.put(LanguageController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      locale: controller.language,
      theme: appTheme,
      //getPages: pages,
      home: const HomeScreen(),
      initialBinding: InitialBindigs(),
    );
  }
}
