import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handling_loading.dart';
import 'package:my_ecommerce/core/constant/colors.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:my_ecommerce/view/widget/Auth/custom_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/homeScreen/home_page_controller.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';
import '../../widget/CustomWidgets/custom_title_h2.dart';
import '../../widget/CustomWidgets/custom_title_h3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => HandlingLoading(
        statusRequest: controller.statusRequest,
        widget: Container(
          color: const Color.fromARGB(255, 255, 243, 227),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitleH1(
                        text: 'Shop Dlala', color: Colors.orange),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              borderRadius: 14,
                              hintText: 'Search Product',
                              borderSideColor: AppColor.black6,
                              fillColor: Colors.white.withOpacity(0.6),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search_outlined),
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.notifications_active,
                                color: Colors.orange,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomTitleH2(
                  text: 'Categories',
                  color: Colors.black.withOpacity(0.7),
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
                            color: Colors.white,
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
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 120,
              //   padding: const EdgeInsets.all(20.0),
              //   margin: const EdgeInsets.symmetric(horizontal: 14.0),
              //   decoration: BoxDecoration(
              //     color: Colors.teal.withOpacity(0.5),
              //     borderRadius: BorderRadius.circular(14),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           CustomTitleH3(
              //               text: 'Ramadan Surprise', color: Colors.orange),
              //           CustomTitleH1(
              //             text: 'Discount 30%',
              //             color: Colors.orange,
              //           ),
              //         ],
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: Colors.white.withOpacity(0.8),
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         width: 80,
              //         padding: const EdgeInsets.all(10),
              //         child: SvgPicture.asset(
              //           'assets/images/discount.svg',
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomTitleH2(
                  text: 'Products for you',
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: controller.items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      '${AppLink.itemsImages}/${controller.items[index]['items_image']}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  '${controller.items[index]['items_name_en']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 6, bottom: 2),
                                child: Text(
                                  'Sold: ${controller.items[index]['items_count']}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              '-${controller.items[index]['items_discount']}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              '${controller.items[index]['items_price']} \$',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
