import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class AddRemoveFavoriteData {
  final Crud crud;

  AddRemoveFavoriteData({required this.crud});
  addFavorite(int itemId, int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.addFavorite,
      {
        'item_id': itemId.toString(),
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int itemId, int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFavorite,
      {
        'item_id': itemId.toString(),
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
