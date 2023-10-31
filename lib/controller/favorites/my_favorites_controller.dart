import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/functions/custom_dialog.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/data_source/remote/favorites/my_favorites_data.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/favorites/remove_favorite_cart_data.dart';

abstract class MyFavoritesController extends GetxController {
  getMyFavorites();
  removeFavoriteCart(int favoritesId);
}

class MyFavoritesControllerImpl extends MyFavoritesController {
  List myFavoritesList = [];

  StatusRequest statusRequest = StatusRequest.none;
  MyFavoritesData myFavoritesData = MyFavoritesData(crud: Get.find());
  RemoveFavoriteCartData removeFavoriteCartData =
      RemoveFavoriteCartData(crud: Get.find());
  MyServices myServices = Get.find();

  int? userId;
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id')!;
    super.onInit();
  }

  @override
  getMyFavorites() async {
    var response = await myFavoritesData.myFavorite(userId!);
    if (response is! StatusRequest) {
      if (response["status"] == "success") {
        statusRequest = StatusRequest.success;
        myFavoritesList.clear();
        myFavoritesList = response["data"];
        Get.toNamed(AppRoutes.myFavoritesScreen);
      } else {
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
    var response = await removeFavoriteCartData.removeFavoriteCart(favoritesId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        myFavoritesList.removeWhere(
          (element) {
            return element['favorites_id'] == favoritesId;
          },
        );
        update();
        customSnackBar(
          title: 'success',
          message: 'This Product has been removed from favorites List',
          success: true,
        );
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
}
