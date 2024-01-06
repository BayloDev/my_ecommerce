import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/items/items_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';

import '../../widget/CustomWidgets/custom_appbar.dart';
import '../../widget/CustomWidgets/custom_item_card.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
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
              backgroundColor: Colors.white.withOpacity(0.85),
              toolbarHeight: 120,
              flexibleSpace: CustomAppBar(
                title: 'Categories',
                back: () => Get.back(),
              ),
              bottom: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                onTap: (value) {
                  controller.changeIndex(value);
                  controller.getItems();
                },
                tabs: controller.categories
                    .map(
                      (element) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
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
                      (e) => Container(
                        color: Colors.black.withOpacity(0.02),
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          itemCount: controller.items.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.88,
                          ),
                          itemBuilder: (context, index) => CustomItemCard(
                            controller: controller,
                            index: index,
                            data: controller.items,
                            favorites: controller.favorites,
                            removeOrFavorite: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  controller.changeFavorite(
                                    index,
                                    controller.items[index]['items_id']!,
                                  );
                                },
                                child: Icon(
                                  controller.favorites[index] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.orange.withOpacity(0.9),
                                  size: 28,
                                ),
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
