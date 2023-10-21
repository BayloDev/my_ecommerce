import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  checkEmail(String email) async {
    var response = await crud.postData(
      AppLink.checkEmail,
      {
        'email': email,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
