import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:my_ecommerce/view/widget/Auth/custom_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/home/home_page_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/class/wave_clipper.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';
import '../../widget/CustomWidgets/custom_title_h2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => ListView(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          CustomTitleH1(
                            text: 'New Year\'s Discount',
                            color: Colors.white,
                            fontSize: 24,
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
              const CustomContainterTitle(title: 'Soug'),
            ],
          ),
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTitleH2(
                    text: 'Categories',
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 112,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: controller.categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () =>
                            controller.goToItems(controller.items, index),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  child: CustomTitleH2(
                    text: 'Products for you',
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 140,
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
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${AppLink.itemsImages}/${controller.items[index]['items_image']}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    translateDatabase(
                                      controller.items[index]['items_name_ar'],
                                      controller.items[index]['items_name_en'],
                                      controller.items[index]['items_name_fr'],
                                    ),
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainterTitle extends StatelessWidget {
  final String title;
  const CustomContainterTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: 170,
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
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    : Container(),
                CustomTitleH1(
                  text: title,
                  color: Colors.white,
                  fontSize: 26,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      fontSize: 16,
                      borderRadius: 12,
                      hintText: 'Search Product',
                      borderSideColor: Colors.white.withOpacity(0.9),
                      fillColor: Colors.white.withOpacity(0.9),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search_outlined),
                        color: Colors.black.withOpacity(0.5),
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
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.notifications_active,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
