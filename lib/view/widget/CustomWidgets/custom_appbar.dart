import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/favorites_controller.dart';
import 'package:my_ecommerce/controller/homeController/home_screen_controller.dart';
import 'package:my_ecommerce/controller/homeController/search_controller.dart';
import 'package:my_ecommerce/core/constant/routes.dart';

import '../../../core/class/wave_clipper.dart';

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
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.withOpacity(0.3),
                Colors.orange.withOpacity(0.4),
                Colors.orange.withOpacity(0.5),
                Colors.orange.withOpacity(0.6),
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
                          child:  Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black.withOpacity(0.6),
                            size: 22,
                          ),
                        )
                      : Container(),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style:  TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: GetBuilder<SearchControllerImpl>(
                        builder: (controller) => GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.search),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Icon(
                                    Icons.search_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Search Products',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
