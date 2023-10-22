import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/colors.dart';
import 'package:my_ecommerce/view/widget/Auth/custom_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/home_controller.dart';
import '../widget/CustomWidgets/custom_title_h1.dart';
import '../widget/CustomWidgets/custom_title_h3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormField(
                    hintText: 'Search Product',
                    borderSideColor: AppColor.black6,
                    fillColor: Colors.white.withOpacity(0.9),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notes_outlined),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      // ListView.builder(
                      //   itemCount: 3,
                      //   shrinkWrap: true,
                      //   scrollDirection: Axis.horizontal,
                      //   itemBuilder: (context, index) => Container(
                      //     height: 150,
                      //     width: 100,
                      //     decoration: BoxDecoration(
                      //       color: Colors.orange.withOpacity(0.5),
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitleH3(text: 'Ramadan Surprise'),
                        SizedBox(height: 10),
                        CustomTitleH1(
                          text: 'Discount Up To 30%',
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/images/discount.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
