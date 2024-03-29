import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/data_source/remote/homeScreen/home_data.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../../core/services/services.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(List items, int selectedIndex);
  goToItemDetails(Map itemsDetails);
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  int? userId;
  String? username;
  String? email;
  String? token;
  List categories = [];
  List<ItemModel> items = [];

  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id');
    username = myServices.sharedPreferences.getString('username');
    email = myServices.sharedPreferences.getString('email');
    token = myServices.sharedPreferences.getString('token');
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getAllData();
    if (response is! StatusRequest) {
      statusRequest = StatusRequest.success;
      if (response["status"] == 'success') {
        if (response["categories"] != null) {
          categories.clear();
          categories.addAll(response["categories"]);
        }
        if (response["items"] != null) {
          items.clear();
          List data = response['items'];
          items.addAll(data.map((e) => ItemModel.fromJson(e)));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
    }

    update();
  }

  @override
  goToItemDetails(itemsDetails) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'item': itemsDetails});
  }

  @override
  goToItems(List items, int selectedIndex) {
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        'categories_name': categories,
        'selected_index': selectedIndex,
      },
    );
  }
}
