import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class MyFavoritesData {
  final Crud crud;

  MyFavoritesData({required this.crud});
  myFavorite(int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.myFavorite,
      {
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
