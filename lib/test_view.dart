import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/test_controller.dart';
import 'core/class/handling_data_view.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Data'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => Text('${controller.data}'),
          ),
        ),
      ),
    );
  }
}
