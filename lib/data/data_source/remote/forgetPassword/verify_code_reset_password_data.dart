import 'package:my_ecommerce/link_api.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeResPassData {
  Crud crud;
  VerifyCodeResPassData(this.crud);
  verifyCode(String email, String code) async {
    var response = await crud.postData(
      AppLink.verifyCodeResetPass,
      {
        'email': email,
        'verify_code': code,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
