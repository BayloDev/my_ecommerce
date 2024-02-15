import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_item_card.dart';
import '../../../controller/homeController/home_page_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/CustomWidgets/custom_appbar.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Container(
        color: Colors.orange.shade50,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.orange.withOpacity(0.25),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            CustomTitleH1(
                              text: 'New Year\'s Discount',
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/discount.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomAppBar(
                  title: 'Shop',
                  back: () {},
                ),
              ],
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                shrinkWrap: true,
                children: [
                  controller.categories.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Container(),
                  controller.categories.isNotEmpty
                      ? SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                              itemCount: controller.categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => controller.goToItems(
                                  controller.items,
                                  index,
                                ),
                                child: Column(
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
                                      translateDatabase(
                                        controller.categories[index]
                                            ['categories_name_ar'],
                                        controller.categories[index]
                                            ['categories_name_en'],
                                        controller.categories[index]
                                            ['categories_name_fr'],
                                      ),
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  controller.items.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 14),
                          child: Text(
                            'Products for you',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Container(),
                  controller.items.isNotEmpty
                      ? SizedBox(
                          height: 140,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                              itemCount: controller.items.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => SizedBox(
                                width: 120,
                                child: CustomItemCard(
                                  index: index,
                                  data: controller.items,
                                  isHome: true,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  controller.categories.isEmpty && controller.items.isEmpty
                      ? Container(
                          padding: EdgeInsets.only(
                            top: (Get.height * 0.5 - 190),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'No Data',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
