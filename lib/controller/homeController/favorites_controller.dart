import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/functions/custom_dialog.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/data_source/remote/homeScreen/favorites_data.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_snackbar.dart';

abstract class FavoritesController extends GetxController {
  getMyFavorites();
  removeFavoriteCart(int favoritesId);
  goToItemDetails(Map itemsDetails);
}

class FavoritesControllerImpl extends FavoritesController {
  List<ItemModel> myFavoritesList = [];
  StatusRequest statusRequest = StatusRequest.none;
  FavoritesData favoritesData = FavoritesData(crud: Get.find());
  MyServices myServices = Get.find();

  int? userId;
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id')!;
    super.onInit();
  }

  @override
  getMyFavorites() async {
    statusRequest = StatusRequest.loading;
    update();
    myFavoritesList.clear();
    var response = await favoritesData.myFavorites(userId!);
    if (response is! StatusRequest) {
      if (response["status"] == "success") {
        statusRequest = StatusRequest.success;
        List data = response["data"];
        myFavoritesList.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        customDialog(
          Colors.red,
          'No Product Found',
          'Please add products to your favorite list and then try again',
        );
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  removeFavoriteCart(int favoritesId) async {
    var response = await favoritesData.removeFromFavorites(favoritesId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        myFavoritesList.removeWhere(
          (element) {
            return element.favorite == favoritesId;
          },
        );
        update();
      } else {
        customSnackBar(
          title: 'Somthig Went Wrong',
          message: 'This Product has not been removed from favorites List',
          success: false,
        );
      }
    } else {
      statusRequest = response;
      customSnackBar(
        title: 'Somthig Went Wrong',
        message: 'This Product has not been removed from favorites List',
        success: false,
      );
    }
    update();
  }

  @override
  goToItemDetails(itemsDetails) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {'item': itemsDetails});
  }
}
