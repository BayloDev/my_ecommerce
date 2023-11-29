import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/data/data_source/remote/homeScreen/home_data.dart';
import 'package:my_ecommerce/view/screen/home/cart_page.dart';
import 'package:my_ecommerce/view/screen/home/settings_page.dart';
import 'package:my_ecommerce/view/screen/home/favorites_page.dart';

import '../../core/services/services.dart';
import '../../view/screen/home/home_page.dart';

class HomeScreenControllerImpl extends GetxController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  RxInt selectedIndex = 0.obs;
  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const CartPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];
}