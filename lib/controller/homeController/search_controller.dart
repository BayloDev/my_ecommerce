import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';

import '../../data/data_source/remote/homeScreen/search_data.dart';
import '../../data/model/item_model.dart';

abstract class SearchController extends GetxController {
  search(String keyword);
  onChanged(String newVal);
}

class SearchControllerImpl extends SearchController {
  int selectedIndex = 0;
  List searchList = [];
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
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.search(keyword);
    if (response is! StatusRequest) {
      if (response["data"] != null) {
        statusRequest = StatusRequest.success;
        List data = response["data"];
        searchList.clear();
        searchList.addAll(data);
        if (searchList.isNotEmpty) {
          isSearch = true;
          update();
        } else {
          isSearch = false;
          update();
        }
        searchList.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
    }
    update();
  }
}
