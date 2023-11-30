import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class CartData {
  final Crud crud;

  CartData({required this.crud});

  removeFromCart(int cartId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFromCart,
      {
        'cart_id': cartId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  countPlus(int cartId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.countPlus,
      {
        'cart_id': cartId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  countMinus(int cartId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.countMinus,
      {
        'cart_id': cartId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getCartItems(int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.getCartItems,
      {
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
