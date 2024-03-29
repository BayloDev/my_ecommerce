import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/core/functions/custom_snackbar.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/data_source/remote/items/items_data.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../../core/class/status_request.dart';
import '../../data/data_source/remote/homeScreen/favorites_data.dart';

abstract class ItemsController extends GetxController {
  getItems();
  changeIndex(int newVal);
  goToItemDetails(Map itemsDetails);
  changeFavorite(int id, int itemId);
}

class ItemsControllerImpl extends ItemsController {
  late List categories;
  List<ItemModel> items = [];
  int selectedIndex = 0;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(crud: Get.find());
  FavoritesData favoriteData = FavoritesData(crud: Get.find());
  MyServices myServices = Get.find();
  Map<int, int> favorites = {};
  late int userId;
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id')!;
    categories = Get.arguments['categories_name'];
    selectedIndex = Get.arguments['selected_index'];
    getItems();

    super.onInit();
  }

  @override
  changeFavorite(id, itemId) async {
    favorites[id] = favorites[id] == 1 ? 0 : 1;
    update();
    var response = favorites[id] == 1
        ? await favoriteData.addFavorite(itemId, userId)
        : await favoriteData.removeFavorite(itemId, userId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
      } else {
        customSnackBar(
          title: 'Somthig Went Wrong',
          message: favorites[id] == 1
              ? 'This Product has not been added to favorites List'
              : 'This Product has not been removed from favorites List',
          success: false,
        );
      }
    } else {
      customSnackBar(
        title: 'Somthig Went Wrong',
        message: favorites[id] == 1
            ? 'This Product has not been added to favorites List'
            : 'This Product has not been removed from favorites List',
        success: false,
      );
    }
    update();
  }

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItems((selectedIndex + 1), userId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        statusRequest = StatusRequest.success;
        items.clear();
        favorites.clear();
        List data = response["data"];
        items.addAll(data.map((e) => ItemModel.fromJson(e)));
        for (var i = 0; i < items.length; i++) {
          favorites[i] = items[i].favorite!;
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
  changeIndex(int newVal) {
    selectedIndex = newVal;
    update();
  }

  @override
  goToItemDetails(itemsDetails) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'item': itemsDetails});
  }
}
