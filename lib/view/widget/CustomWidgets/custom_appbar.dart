import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/favorites_controller.dart';
import 'package:my_ecommerce/controller/homeController/home_screen_controller.dart';
import 'package:my_ecommerce/controller/homeController/search_controller.dart';
import 'package:my_ecommerce/core/constant/routes.dart';

import '../../../core/class/wave_clipper.dart';
import '../Auth/custom_text_form_field.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function()? back;
  const CustomAppBar({
    super.key,
    required this.title,
    this.back,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesControllerImpl());
    Get.put(HomeScreenControllerImpl());
    Get.put(SearchControllerImpl());
    return ClipPath(
      clipper: WaveClipper(),
      child: GetBuilder<FavoritesControllerImpl>(
        builder: (controller) => Container(
          height: 140,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.orange.withOpacity(0.9),
                Colors.orange.withOpacity(0.8),
                Colors.orange.withOpacity(0.7),
                Colors.orange.withOpacity(0.6),
                Colors.orange.withOpacity(0.5),
                Colors.orange.withOpacity(0.4),
                Colors.orange.withOpacity(0.3),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  title == 'Categories'
                      ? GestureDetector(
                          onTap: back,
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Expanded(
                      child: GetBuilder<SearchControllerImpl>(
                        builder: (controller) => CustomTextFormField(
                          onTap: () => Get.toNamed(AppRoutes.search),
                          fontSize: 16,
                          borderRadius: 12,
                          hintText: 'Search Product',
                          borderSideColor: const Color.fromARGB(255, 44, 39, 39)
                              .withOpacity(0.9),
                          fillColor: Colors.white.withOpacity(0.9),
                          prefixIcon: IconButton(
                            onPressed: () =>
                                controller.search(controller.keyword.text),
                            icon: const Icon(Icons.search_outlined),
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
