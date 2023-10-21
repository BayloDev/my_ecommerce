import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  resetPasswordData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
