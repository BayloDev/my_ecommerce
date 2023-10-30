import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/view/screen/home/home_page.dart';

import '../../link_api.dart';

class Items extends StatelessWidget {
  const Items({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImpl());
    return SafeArea(
      child: GetBuilder<ItemsControllerImpl>(
        builder: (controller) => DefaultTabController(
          initialIndex: controller.selectedIndex,
          length: controller.categories.length,
          child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.white.withOpacity(0.9),
              toolbarHeight: 120,
              flexibleSpace: const CustomContainterTitle(title: 'Categories'),
              bottom: TabBar(
                isScrollable: true,
                onTap: (value) {
                  controller.changeIndex(value);
                  controller.getItems();
                },
                tabs: controller.categories
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          translateDatabase(
                              element['categories_name_ar'],
                              element['categories_name_en'],
                              element['categories_name_fr']),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            body: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: TabBarView(
                physics: const ScrollPhysics(
                  parent: NeverScrollableScrollPhysics(),
                ),
                children: controller.categories
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: controller.items.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => controller
                                .goToItemDetails(controller.items[index]),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                            child: Hero(
                                              tag: controller.items[index]
                                                  ['items_id'],
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${AppLink.itemsImages}/${controller.items[index]['items_image']}',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                          color: Colors.orange.shade500,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                translateDatabase(
                                                  controller.items[index]
                                                      ['items_name_ar'],
                                                  controller.items[index]
                                                      ['items_name_en'],
                                                  controller.items[index]
                                                      ['items_name_fr'],
                                                ),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6, bottom: 2),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Sold : ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${controller.items[index]['items_count']}',
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        height: 1.2),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: controller.items[index]
                                                ['items_discount'] !=
                                            0
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '-${controller.items[index]['items_discount']}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      height: 1),
                                                ),
                                                const Text(
                                                  '%',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ))
                                        : Container(),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
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
                                      child: Row(
                                        children: [
                                          Text(
                                            '${controller.items[index]['items_price']}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              height: 1,
                                            ),
                                          ),
                                          const Text(
                                            '\$',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              inherit: false,
                                              height: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () => controller.changeFavorite(
                                          index + 1,
                                          controller.items[index]['items_id']
                                              .toString(),
                                        ),
                                        child: Icon(
                                          controller.favorites[index + 1] == 1
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red.withOpacity(0.9),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 48,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        Icon(
                                          Icons.star_half,
                                          size: 18,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          size: 18,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
