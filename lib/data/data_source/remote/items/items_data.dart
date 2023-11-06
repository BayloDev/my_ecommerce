import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/core/class/crud.dart';
import 'package:my_ecommerce/core/class/status_request.dart';
import 'package:my_ecommerce/link_api.dart';

class ItemsData {
  final Crud crud;

  ItemsData({required this.crud});
  getItems(int categoryId, int userId) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.items,
      {
        'category_id': categoryId.toString(),
        'user_id': userId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}