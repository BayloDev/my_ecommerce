import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(child: Text('${controller.id}')),
            Center(child: Text('${controller.email}')),
            Center(child: Text('${controller.username}')),
            Center(child: Text('${controller.token}')),
          ],
        ),
      ),
    );
  }
}
