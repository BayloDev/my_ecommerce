import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/model/cart_model.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/cart/cart_data.dart';

abstract class CartController extends GetxController {
  getCartItems();
  removeItemFromCart(int itemId);
  addItemToCart(int itemId);
  itemCount(int itemId);
  updateCount(int itemId);
  countPlus();
  countMinus();
  goToItemDetails(Map itemsDetails);
}

class CartControllerImpl extends CartController {
  List<CartModel> cartItems = [];
  int count = 1;
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  int? userId;
  int totalPrice = 0;
  int shipping = 100;
  // @override
  // void onInit() {
  //   userId = myServices.sharedPreferences.getInt('id')!;
  //   getCartItems();
  //   super.onInit();
  // }

  @override
  InternalFinalCallback<void> get onDelete {
    userId = myServices.sharedPreferences.getInt('id')!;
    getCartItems();
    update();
    return super.onDelete;
  }

  @override
  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartItems(userId!);
    if (response is! StatusRequest) {
      if (response["data"] != null) {
        statusRequest = StatusRequest.success;
        cartItems.clear();
        totalPrice = 0;
        List dataResponse = response['data'];
        cartItems.addAll(dataResponse.map((e) {
          print('--------------');

          print(totalPrice);
          totalPrice = totalPrice + e['total_price'] as int;
          return CartModel.fromJson(e);
        }));
        print('==========');
        print(totalPrice);
        update();
        // for (var i = 0; i < cartItems.length - 1; i++) {
        //   totalPrice = totalPrice + cartItems[i].totalPrice!;
        // }
        // update();
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  addItemToCart(int itemId) async {
    var response = await cartData.addToCart(userId!, itemId, count);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        customSnackBar(
          title: 'Success',
          message: 'Item added to cart',
          success: true,
        );
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  removeItemFromCart(int itemId) async {
    var response = await cartData.removeFromCart(userId!, itemId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        // cart.removeWhere(
        //   (element) {
        //     return element['favorites_id'] == favoritesId;
        //   },
        // );
        update();
      } else {
        customSnackBar(
          title: 'Failed',
          message: 'Somthig Went Wrong',
          success: false,
        );
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
  itemCount(int itemId) async {
    var response = await cartData.countItem(userId!, itemId);
    if (response is! StatusRequest) {
      count = response["count"];
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  updateCount(int itemId) async {
    var response = await cartData.updateCount(userId!, itemId);
    if (response is! StatusRequest) {
      if (response["count"] == 0) {
        count = 0;
        update();
      } else {
        count = response["count"];
        update();
      }
    } else {
      statusRequest = response;
      count = 0;
      update();
    }
    update();
  }

  @override
  countPlus() {
    count++;
    update();
  }

  @override
  countMinus() {
    if (count > 1) {
      count--;
      update();
    }
  }
}
