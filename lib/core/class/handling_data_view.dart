import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_title_h1.dart';

import '../constant/images.dart';
import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, height: 200, width: 300))
        : statusRequest == StatusRequest.failure ||
                statusRequest == StatusRequest.serverException ||
                statusRequest == StatusRequest.serverFailure ||
                statusRequest == StatusRequest.offlineFailure
            ? SizedBox(
                height: Get.height / 2,
                width: Get.width,
                child: const Center(
                    child: CustomTitleH1(
                  text: 'No items yet',
                  fontSize: 18,
                )),
              )
            : widget;
  }
}
