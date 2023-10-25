import 'package:get/get.dart';
import 'package:my_ecommerce/data/data_source/remote/items_data.dart';

import '../core/class/status_request.dart';

abstract class ItemsController extends GetxController {
  getItems();
}

class ItemsControllerImpl extends ItemsController {
  late List categories;
  List items = [];
  late int selectedIndex;
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
    var response = await itemsData.getItems(selectedIndex.toString());
    if (response is! StatusRequest) {
      statusRequest = StatusRequest.success;
      if (response["status"] == 'success') {
        statusRequest = StatusRequest.success;
        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
      update();
    }
    update();
  }
}
