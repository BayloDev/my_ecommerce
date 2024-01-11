import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_ecommerce/controller/homeController/cart_controller.dart';
import 'package:my_ecommerce/controller/homeController/favorites_controller.dart';
import 'package:my_ecommerce/controller/homeController/home_page_controller.dart';
import 'package:my_ecommerce/controller/homeController/home_screen_controller.dart';

import '../../../core/constant/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImpl homeScreenController = Get.put(
      HomeScreenControllerImpl(),
    );
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              color: Colors.white.withOpacity(0.3),
              child: homeScreenController
                  .widgetOptions[homeScreenController.selectedIndex],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: GNav(
                rippleColor: Colors.white,
                hoverColor: Colors.orange,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(seconds: 1),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.white,
                tabBorderRadius: 20,
                tabBackgroundGradient: LinearGradient(
                  colors: [
                    Colors.orange.shade800,
                    Colors.orange.shade700,
                    Colors.orange.shade600,
                    Colors.orange.shade500,
                    Colors.orange.shade400,
                    Colors.orange.shade300,
                    Colors.orange.shade200,
                    Colors.orange.shade100,
                    
                  ],
                ),
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                    onPressed: () {
                      HomeControllerImpl homeControllerImpl =
                          Get.put(HomeControllerImpl());
                      homeControllerImpl.getData();
                    },
                  ),
                  GButton(
                    icon: Icons.shopping_cart_outlined,
                    text: 'Cart',
                    onPressed: () {
                      CartControllerImpl cartControllerImpl =
                          Get.put(CartControllerImpl());
                      cartControllerImpl.getCartItems();
                    },
                  ),
                  GButton(
                    icon: Icons.favorite_outline_rounded,
                    text: 'Wish',
                    onPressed: () {
                      FavoritesControllerImpl wishController = Get.put(
                        FavoritesControllerImpl(),
                      );
                      wishController.getMyFavorites();
                    },
                  ),
                  GButton(
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                    onPressed: () {},
                  ),
                ],
                selectedIndex: homeScreenController.selectedIndex,
                onTabChange: (index) => controller.changeIndex(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
