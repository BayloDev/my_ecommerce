import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handling_loading.dart';
import 'package:my_ecommerce/core/constant/colors.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:my_ecommerce/view/widget/Auth/custom_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controller/home_controller.dart';
import '../widget/CustomWidgets/custom_title_h1.dart';
import '../widget/CustomWidgets/custom_title_h2.dart';
import '../widget/CustomWidgets/custom_title_h3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
      body: GetBuilder<HomeControllerImpl>(
        builder: (controller) => HandlingLoading(
          statusRequest: controller.statusRequest,
          widget: Container(
            color: Colors.white.withOpacity(0.4),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 58, 134, 118),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 6),
                      child: CustomTitleH1(
                        text: 'Shop Dlala',
                        color: Colors.orange,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextFormField(
                            hintText: 'Search Product',
                            borderSideColor: AppColor.black6,
                            fillColor: Colors.white.withOpacity(0.6),
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
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CustomTitleH2(
                    text: 'Categories',
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: controller.categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            height: 80,
                            width: 90,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.network(
                              '${AppLink.categoriesImages}/${controller.categories[index]['categories_image']}',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${controller.categories[index]['categories_name_en']}',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 14.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 58, 134, 118),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitleH3(
                              text: 'Ramadan Surprise', color: Colors.orange),
                          CustomTitleH1(
                            text: 'Discount 30%',
                            color: Colors.orange,
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
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CustomTitleH2(
                    text: 'Products for you',
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: controller.items.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 120,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  '${AppLink.itemsImages}/${controller.items[index]['items_image']}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Positioned(
                            bottom: 3,
                            child: Text(
                              '${controller.items[index]['items_name_en']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
