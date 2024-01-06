import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/data_source/remote/homeScreen/home_data.dart';
import 'package:my_ecommerce/view/screen/home/cart_page.dart';
import 'package:my_ecommerce/view/screen/home/settings_page.dart';
import 'package:my_ecommerce/view/screen/home/favorites_page.dart';

import '../../core/services/services.dart';
import '../../view/screen/home/home_page.dart';

abstract class HomeScreenController extends GetxController {
  goToSearch();
  changeIndex(int index);
}

class HomeScreenControllerImpl extends HomeScreenController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  int selectedIndex = 0;
  TextEditingController keyword = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const CartPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  @override
  goToSearch() {
    Get.toNamed(AppRoutes.search);
  }
}
