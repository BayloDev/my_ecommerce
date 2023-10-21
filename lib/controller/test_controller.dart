import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../data/data_source/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getAllData();
    //statusRequest = handlingStatusRequest(response);
    if (response is! StatusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = response;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
