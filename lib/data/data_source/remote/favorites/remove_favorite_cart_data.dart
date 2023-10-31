import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class RemoveFavoriteCartData {
  final Crud crud;

  RemoveFavoriteCartData({required this.crud});
  removeFavoriteCart(int favoritesId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.removeFavoriteCart,
      {
        'favorites_id': favoritesId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
