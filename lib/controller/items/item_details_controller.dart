import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/cart_controller.dart';
import 'package:my_ecommerce/data/data_source/remote/items/items_data.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../core/services/services.dart';

abstract class ItemsDetailsController extends GetxController {
  addItemToCart(int itemId);
  changeSelectedColor(int index);
  countPlus();
  countMinus();
}

class ItemsDetailsControllerImpl extends ItemsDetailsController {
  Map itemDetails = {};
  int selectedColor = 1;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(crud: Get.find());
  MyServices myServices = Get.find();
  int? userId;
  int count = 1;
  late final Size size;
  CartControllerImpl cartController = Get.put(CartControllerImpl());
  @override
  void onInit() {
    itemDetails = Get.arguments['item'];
    size = calcTextSize(
        itemDetails['items_desc'], const TextStyle(fontSize: 14));

    itemDetails['items_color'] = [
      'Yellow',
      'Black',
      'Green',
      'White',
      'red',
      'orange'
    ];
    userId = myServices.sharedPreferences.getInt('id')!;
    super.onInit();
  }

  Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaler: TextScaler.noScaling,
    )..layout();
    return textPainter.size;
  }

  @override
  addItemToCart(int itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.addToCart(userId!, itemId, count);
    if (response is! StatusRequest) {
      Get.back();
      statusRequest = StatusRequest.success;
      if (response["status"] == 'success') {
        customSnackBar(
          title: 'Success',
          message: 'Item added to cart',
          success: true,
        );
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  changeSelectedColor(int index) {
    selectedColor = index;
    update();
  }

  @override
  countMinus() {
    if (count > 1) {
      count--;
      update();
    }
  }

  @override
  countPlus() {
    count++;
    update();
  }
}
