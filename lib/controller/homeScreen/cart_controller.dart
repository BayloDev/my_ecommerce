import 'package:get/get.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/model/cart_model.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/homeScreen/cart_data.dart';

abstract class CartController extends GetxController {
  getCartItems();
  removeItemFromCart(int itemId);
  addItemToCart(int itemId);
  itemCount(int itemId);
  updateCount(int itemId);
  countPlus();
  countMinus();
  goToItemDetails(Map itemsDetails);
  changeOnDown();
}

class CartControllerImpl extends CartController {
  List<CartModel> cartItems = [];
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  int? userId;
  int count = 1;
  double totalPrice = 0.0;
  double shipping = 100.0;
  int totalItems = 0;
  int placeOrderCount = 0;
  bool onDown = false;
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id')!;
    getCartItems();
    super.onInit();
  }

  @override
  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartItems(userId!);

    if (response is! StatusRequest) {
      statusRequest = StatusRequest.success;
      if (response["data"] != null) {
        cartItems.clear();
        totalPrice = 0;
        List dataResponse = response['data'];
        cartItems.addAll(dataResponse.map((e) {
          totalPrice = totalPrice + e['total_price'];
          return CartModel.fromJson(e);
        }));
        totalItems = cartItems.length;
      } else {
        statusRequest = StatusRequest.failure;
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

  @override
  changeOnDown() {
    onDown = !onDown;
    update();
  }
}
