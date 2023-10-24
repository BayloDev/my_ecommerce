import 'package:get/get.dart';

abstract class ItemsController extends GetxController {}

class ItemsControllerImpl extends ItemsController {
  late List items;
  late List categories;
  late int selectedIndex;
  @override
  void onInit() {
    items = Get.arguments['items'];
    categories = Get.arguments['categories_name'];
    selectedIndex = Get.arguments['selectedIndex'];
    super.onInit();
  }
}
