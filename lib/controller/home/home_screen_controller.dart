import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/data/data_source/remote/home_data.dart';
import 'package:my_ecommerce/view/screen/home/cart_page.dart';
import 'package:my_ecommerce/view/screen/home/settings_page.dart';
import 'package:my_ecommerce/view/screen/home/wish_page.dart';

import '../../core/services/services.dart';
import '../../view/screen/home/home_page.dart';

abstract class HomeScreenController extends GetxController {}

class HomeScreenControllerImpl extends HomeScreenController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  RxInt selectedIndex = 0.obs;
  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const WishPage(),
    const SettingsPage(),
    const CartPage(),
  ];
}
