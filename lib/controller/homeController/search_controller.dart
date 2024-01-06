import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/core/constant/routes.dart';

import '../../data/data_source/remote/homeScreen/search_data.dart';
import '../../data/model/item_model.dart';

abstract class SearchController extends GetxController {
  search(String keyword);
  onChanged(String newVal);
  goToItemDetails(Map itemsDetails);
}

class SearchControllerImpl extends SearchController {
  int selectedIndex = 0;
  List<ItemModel> searchList = [];
  TextEditingController keyword = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;

  SearchData searchData = SearchData(Get.find());
  bool isSearch = false;
  @override
  onChanged(String newVal) {
    if (newVal.isEmpty) {
      isSearch = false;
      update();
    }
  }

  @override
  search(keyword) async {
    if (keyword.isEmpty) {
      searchList.clear();
      update();
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await searchData.search(keyword);
      if (response is! StatusRequest) {
        if (response["data"] != null) {
          searchList.clear();
          update();
          statusRequest = StatusRequest.success;
          List data = response["data"];

          searchList.addAll(data.map((e) => ItemModel.fromJson(e)));
          if (searchList.isNotEmpty) {
            isSearch = true;
            update();
          } else {
            isSearch = false;
            update();
          }
        } else {
          searchList.clear();
          statusRequest = StatusRequest.failure;
        }
      } else {
        searchList.clear();
        statusRequest = response;
      }
      update();
    }
  }

  @override
  goToItemDetails(Map itemsDetails) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'item': itemsDetails});
  }
}
