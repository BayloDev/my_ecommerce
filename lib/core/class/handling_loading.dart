import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/images.dart';
import 'status_request.dart';

class HandlingLoading extends StatelessWidget {
  const HandlingLoading({
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
        : widget;
  }
}
