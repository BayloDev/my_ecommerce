import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_ecommerce/controller/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImpl controller = Get.put(HomeScreenControllerImpl());
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Center(
            child: controller.widgetOptions[controller.selectedIndex.value],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade400,
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
                tabs: const [
                  GButton(icon: Icons.home_outlined, text: 'Home'),
                  GButton(icon: Icons.favorite_outline_rounded, text: 'Wish'),
                  GButton(icon: Icons.settings_outlined, text: 'Settings'),
                  GButton(icon: Icons.account_circle_outlined, text: 'Profile'),
                ],
                selectedIndex: controller.selectedIndex.value,
                onTabChange: (index) => controller.selectedIndex.value = index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
