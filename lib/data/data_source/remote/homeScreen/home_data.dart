import 'package:dartz/dartz.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/class/status_request.dart';
import '../../../../link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  Future getAllData() async {
    Either<StatusRequest, Map> response = await crud.postData(AppLink.home, {});
    return response.fold((left) => left, (right) => right);
  }
}
