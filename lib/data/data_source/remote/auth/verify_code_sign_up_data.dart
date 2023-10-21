import '../../../../core/class/crud.dart';
import '../../../../link_api.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  verifyCode(String email, String code) async {
    var response = await crud.postData(AppLink.verifyCode, {
      'email': email,
      'verify_code': code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
