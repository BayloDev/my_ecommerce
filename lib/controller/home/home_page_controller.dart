import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/data_source/remote/home_data.dart';

import '../../core/services/services.dart';

abstract class HomeController extends GetxController {
  getData();
  goToItems(List items, int selectedIndex);
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? id;
  String? username;
  String? email;
  String? token;
  List categories = [];
  List items = [];
  @override
  void onInit() {
    id = myServices.sharedPreferences.getString('id');
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
        statusRequest = StatusRequest.success;
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
    }
    update();
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
