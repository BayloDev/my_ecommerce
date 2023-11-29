import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class FavoritesData {
  final Crud crud;

  FavoritesData({required this.crud});
  removeFromFavorites(int favoritesId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFromFavorites,
      {
        'favorites_id': favoritesId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

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

  myFavorites(int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.myFavorites,
      {
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
