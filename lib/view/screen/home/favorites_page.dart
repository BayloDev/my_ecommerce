import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/favorites_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_appbar.dart';
import '../../widget/CustomWidgets/custom_item_card.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesControllerImpl());
    return SafeArea(
      child: GetBuilder<FavoritesControllerImpl>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.01),
            leading: Container(),
            toolbarHeight: 140,
            flexibleSpace: CustomAppBar(
              title: 'Wish(${controller.myFavoritesList.length})',
            ),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.black.withOpacity(0.01),
              child: controller.myFavoritesList.isEmpty
                  ? const Center(child: CustomTitleH1(text: 'No Data'))
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: controller.myFavoritesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) => CustomItemCard(
                          index: index,
                          data: controller.myFavoritesList,
                          favorites: const {},
                          removeOrFavorite: Container(
                            padding: const EdgeInsets.all(0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () => controller.removeFavoriteCart(
                                controller.myFavoritesList[index].favoritesId!,
                              ),
                              child: Icon(
                                Icons.delete_forever_sharp,
                                color: Colors.red.withOpacity(0.9),
                                size: 26,
                              ),
                            ),
                          ),
                          isHome: false,
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
