import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class FavoriteData {
  final Crud crud;

  FavoriteData({required this.crud});
  addFavorite(String itemId, String userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.addFavorite,
      {
        'item_id': itemId,
        'user_id': userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String itemId, String userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFavorite,
      {
        'item_id': itemId,
        'user_id': userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
