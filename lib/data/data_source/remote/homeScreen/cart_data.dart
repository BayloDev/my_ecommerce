import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class CartData {
  final Crud crud;

  CartData({required this.crud});
  addToCart(int userId, int itemId, int count) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.addToCart,
      {
        'user_id': userId.toString(),
        'item_id': itemId.toString(),
        'item_count': count.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart(int userId, int itemId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFromCart,
      {
        'user_id': userId.toString(),
        'item_id': itemId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  countItem(int userId, int itemId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.count,
      {
        'user_id': userId.toString(),
        'item_id': itemId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  updateCount(int userId, int itemId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.updateCount,
      {
        'user_id': userId.toString(),
        'item_id': itemId.toString(),
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
