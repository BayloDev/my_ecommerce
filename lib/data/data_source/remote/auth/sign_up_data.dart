import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  signUpData(String username, String email, String password) async {
    var response = await crud.postData(AppLink.signUp, {
      'username': username,
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
