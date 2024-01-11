import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/functions/custom_dialog.dart';
import 'package:my_ecommerce/core/functions/custom_dialog_question.dart';
import 'package:my_ecommerce/core/services/services.dart';
import 'package:my_ecommerce/data/model/cart_model.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/custom_snackbar.dart';
import '../../data/data_source/remote/homeScreen/cart_data.dart';

abstract class CartController extends GetxController {
  getCartItems();
  countPlus(int cartId);
  countMinus(int cartId);
  goToItemDetails(Map itemsDetails);
  changeOnDown();
  onCheckBoxtap(int index);
  checkAll();
  updateValues();
  delete();
}

class CartControllerImpl extends CartController {
  List<CartModel> cartItems = [];
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  int? userId;
  double price = 0.0;
  double shipping = 100.0;
  int placeOrderCount = 0;
  bool onDown = false;
  bool onAllCheck = true;
  List<bool> checkBoxList = [];
  List<int> cartIds = [];
  @override
  void onInit() {
    userId = myServices.sharedPreferences.getInt('id')!;
    super.onInit();
  }

  @override
  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartItems(userId!);
    cartItems.clear();
    checkBoxList.clear();
    price = 0;
    if (response is! StatusRequest) {
      if (response["data"] != null) {
        statusRequest = StatusRequest.success;

        List dataResponse = response['data'];
        cartItems.addAll(dataResponse.map((e) {
          checkBoxList.add(true);
          price = price + e['total_price'];
          return CartModel.fromJson(e);
        }));
        placeOrderCount = checkBoxList.length;
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
  countPlus(int cartId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.countPlus(cartId);
    if (response is! StatusRequest) {
      if (response["status"] == 'success') {
        statusRequest = StatusRequest.success;
        int position =
            cartItems.indexWhere((element) => element.cartId == cartId);
        cartItems[position].cartItemNumber =
            cartItems[position].cartItemNumber! + 1;
        if (checkBoxList[position] == true) {
          price += cartItems[position].itemsPrice!;
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
  countMinus(int cartId) async {
    int position = cartItems.indexWhere((element) => element.cartId == cartId);
    if (cartItems[position].cartItemNumber! > 1) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await cartData.countMinus(cartId);
      if (response is! StatusRequest) {
        if (response["status"] == 'success') {
          statusRequest = StatusRequest.success;
          cartItems[position].cartItemNumber =
              cartItems[position].cartItemNumber! - 1;
          if (checkBoxList[position] == true) {
            price -= cartItems[position].itemsPrice!;
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = response;
      }
      update();
    } else {
      customDialogQuestion(
        () async {
          Get.back();
          cartIds.clear();
          cartIds.add(cartId);
          String idsString = cartIds.toString();
          idsString = idsString.substring(0, idsString.length - 1);
          idsString = idsString.substring(1, idsString.length);
          statusRequest = StatusRequest.loading;
          update();
          var response = await cartData.removeFromCart(idsString);
          if (response is! StatusRequest) {
            if (response["status"] == 'success') {
              statusRequest = StatusRequest.success;
              placeOrderCount--;
              price = price - cartItems[position].itemsPrice!;
              cartItems.removeWhere(
                (element) {
                  return element.cartId == cartId;
                },
              );
              checkBoxList.removeAt(position);
              if (cartItems.isEmpty) {
                statusRequest = StatusRequest.failure;
              }
            } else {
              statusRequest = StatusRequest.failure;
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
        },
      );
    }
  }

  @override
  changeOnDown() {
    onDown = !onDown;
    update();
  }

  @override
  onCheckBoxtap(int index) {
    if (checkBoxList[index] == true) {
      checkBoxList[index] = false;
    } else {
      checkBoxList[index] = true;
    }
    updateValues();

    update();
  }

  @override
  checkAll() {
    onAllCheck = onAllCheck == true ? false : true;
    if (onAllCheck == true) {
      price = 0;
      shipping = 100.0;
      for (var i = 0; i < checkBoxList.length; i++) {
        checkBoxList[i] = true;
        price += cartItems[i].itemsPrice! * cartItems[i].cartItemNumber!;
      }
      placeOrderCount = checkBoxList.length;
    } else {
      shipping = 0.0;
      price = 0;
      for (var i = 0; i < cartItems.length; i++) {
        checkBoxList[i] = false;
      }
      placeOrderCount = 0;
    }
    update();
  }

  @override
  updateValues() {
    price = 0.0;
    shipping = 100.0;
    placeOrderCount = 0;
    for (var i = 0; i < cartItems.length; i++) {
      if (checkBoxList[i] == true) {
        price += cartItems[i].itemsPrice! * cartItems[i].cartItemNumber!;
        placeOrderCount++;
      }
    }
    if (placeOrderCount == cartItems.length) {
      onAllCheck = true;
    } else {
      onAllCheck = false;
    }
    if (price == 0.0) {
      shipping = 0.0;
    }
  }

  @override
  delete() async {
    customDialogQuestion(checkBoxList.contains(true)
        ? () async {
            Get.back();
            cartIds.clear();
            for (var i = 0; i < checkBoxList.length; i++) {
              if (checkBoxList[i] == true) {
                cartIds.add(cartItems[i].cartId!);
              }
            }
            String idsString = cartIds.toString();
            idsString = idsString.substring(0, idsString.length - 1);
            idsString = idsString.substring(1, idsString.length);
            statusRequest = StatusRequest.loading;
            update();

            var response = await cartData.removeFromCart(idsString);
            if (response is! StatusRequest) {
              if (response["status"] == 'success') {
                statusRequest = StatusRequest.success;
                for (var i = 0; i < checkBoxList.length; i++) {
                  if (checkBoxList[i] == true) {
                    price = price -
                        cartItems[i].itemsPrice! * cartItems[i].cartItemNumber!;
                    placeOrderCount--;
                  }
                }
                shipping = 0.0;

                for (var i = 0; i < cartIds.length; i++) {
                  cartItems.removeWhere((element) {
                    return cartIds[i] == element.cartId;
                  });
                  checkBoxList.remove(true);
                }
                if (cartItems.isEmpty || checkBoxList.isEmpty) {
                  statusRequest = StatusRequest.failure;
                }
              } else {
                statusRequest = StatusRequest.failure;
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
        : () {
            Get.back();
            customDialog(Colors.orange, 'Warnnig', 'No item selected');
          });
  }
}
