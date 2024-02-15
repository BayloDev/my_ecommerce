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
        ? Container(
            color: Colors.orange.shade50,
            child: Center(
              child: Container(
                color: Colors.orange.shade50,
                child: Lottie.asset(
                  AppImageAsset.loading,
                ),
              ),
            ),
          )
        : statusRequest == StatusRequest.failure ||
                statusRequest == StatusRequest.serverException ||
                statusRequest == StatusRequest.serverFailure ||
                statusRequest == StatusRequest.offlineFailure
            ? Container(
                color: Colors.orange.shade50,
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
