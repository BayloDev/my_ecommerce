import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/data_source/remote/items_data.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../core/class/status_request.dart';

abstract class ItemsController extends GetxController {
  getItems();
  changeIndex(int newVal);
  goToItemDetails(Map itemsDetails);
}

class ItemsControllerImpl extends ItemsController {
  late List categories;
  List items = [];
  late int selectedIndex;
  ItemModel itemModel = ItemModel();
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(crud: Get.find());
  @override
  void onInit() {
    categories = Get.arguments['categories_name'];
    selectedIndex = Get.arguments['selected_index'];
    getItems();
    super.onInit();
  }

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItems((selectedIndex + 1).toString());
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        items = [];
        statusRequest = StatusRequest.success;
        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  changeIndex(int newVal) {
    selectedIndex = newVal;
    update();
  }

  @override
  goToItemDetails(itemsDetails) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'item': itemsDetails});
  }
}
