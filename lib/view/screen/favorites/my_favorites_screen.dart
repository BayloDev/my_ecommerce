import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/favorites/my_favorites_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_appbar.dart';
import '../../widget/CustomWidgets/custom_item_card.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritesControllerImpl());
    return SafeArea(
      child: GetBuilder<MyFavoritesControllerImpl>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.02),
            leading: Container(),
            toolbarHeight: 140,
            flexibleSpace: CustomAppBar(
              title: 'Favorites',
              back: () => Get.back(),
            ),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.black.withOpacity(0.02),
              child: controller.myFavoritesList.isEmpty
                  ? Center(
                      child: Text(
                        'Empty',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: controller.myFavoritesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.88,
                        ),
                        itemBuilder: (context, index) => CustomItemCard(
                          controller: controller,
                          index: index,
                          data: controller.myFavoritesList,
                          favorites: const {},
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
                              onTap: () => controller.removeFavoriteCart(
                                controller.myFavoritesList[index]
                                    ['favorites_id'],
                              ),
                              child: Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.orange.withOpacity(0.9),
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
