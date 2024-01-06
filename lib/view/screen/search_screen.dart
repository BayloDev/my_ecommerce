import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homeController/search_controller.dart';
import '../widget/Auth/custom_text_form_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SearchControllerImpl>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            flexibleSpace: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
                CustomTextFormField(
                  controller: controller.keyword,
                  fontSize: 16,
                  borderRadius: 12,
                  hintText: 'Search Product',
                  borderSideColor: Colors.white.withOpacity(0.9),
                  fillColor: Colors.white.withOpacity(0.9),
                  prefixIcon: IconButton(
                    onPressed: () => controller.search(
                      controller.keyword.text,
                    ),
                    icon: const Icon(Icons.search_outlined),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          body: Center(
            child: ListView.builder(
              itemCount: controller.searchList.length,
              itemBuilder: (context, index) => Text(
                controller.searchList[index].itemsNameEn!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
