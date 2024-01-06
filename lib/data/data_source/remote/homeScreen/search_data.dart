import 'package:dartz/dartz.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../link_api.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  Future search(String keyword) async {
    Either<StatusRequest, Map> response = await crud.postData(
      AppLink.search,
      {
        'search': keyword,
      },
    );
    return response.fold((left) => left, (right) => right);
  }
}
