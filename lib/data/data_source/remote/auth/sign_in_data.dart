
import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class SignInData {
  Crud crud;
  SignInData(this.crud);
  signInData(String email, String password) async {
    var response = await crud.postData(AppLink.signIn, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
