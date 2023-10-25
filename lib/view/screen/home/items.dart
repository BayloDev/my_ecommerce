import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/view/screen/home/home_page.dart';

import '../../../link_api.dart';

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
                          element['categories_name_en'],
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
                  children: controller.categories
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                            ),
                            children: controller.items
                                .where(
                                  (element) =>
                                      element["categories_name_en"] ==
                                      controller.categories[controller
                                          .selectedIndex]["categories_name_en"],
                                )
                                .map(
                                  (element) => Card(
                                    color: Colors.orange.withOpacity(0.7),
                                    elevation: 2,
                                    margin: const EdgeInsets.all(4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        '${AppLink.itemsImages}/${element['items_image']}',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                '${element['items_name_en']}',
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
                                              child: Text(
                                                'Sold: ${element['items_count']}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: element['items_discount'] != 0
                                              ? Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 4,
                                                    vertical: 1,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      topLeft:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    '-${element['items_discount']}%',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                )
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
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              '${element['items_price']} \$',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 42,
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(Icons.star,
                                                    size: 18,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                                Icon(Icons.star,
                                                    size: 18,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                                Icon(Icons.star,
                                                    size: 18,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                                Icon(Icons.star_half,
                                                    size: 18,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                                Icon(Icons.star_border_outlined,
                                                    size: 18,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                      .toList()),
            ),
          ),
        ),
      ),
    );
  }
}
