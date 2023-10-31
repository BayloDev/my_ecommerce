import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/favorites/my_favorites_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_appbar.dart';

import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritesControllerImpl());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.02),
          leading: Container(),
          toolbarHeight: 140,
          flexibleSpace: const CustomAppBar(title: 'Favorites'),
        ),
        body: GetBuilder<MyFavoritesControllerImpl>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.black.withOpacity(0.02),
              child: controller.myFavoritesList.isEmpty
                  ? Center(
                      child: Text(
                        'Empty',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 20),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: controller.myFavoritesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${AppLink.itemsImages}/${controller.myFavoritesList[index]['items_image']}',
                                            fit: BoxFit.fill,
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
                                            padding:
                                                const EdgeInsets.only(left: 6),
                                            child: Text(
                                              translateDatabase(
                                                controller
                                                        .myFavoritesList[index]
                                                    ['items_name_ar'],
                                                controller
                                                        .myFavoritesList[index]
                                                    ['items_name_en'],
                                                controller
                                                        .myFavoritesList[index]
                                                    ['items_name_fr'],
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
                                            padding: const EdgeInsets.only(
                                                left: 6, bottom: 2),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Sold : ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '${controller.myFavoritesList[index]['items_count']}',
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
                                  child: controller.myFavoritesList[index]
                                              ['items_discount'] !=
                                          0
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 1,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.9),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                '-${controller.myFavoritesList[index]['items_discount']}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
                                          '${controller.myFavoritesList[index]['items_price']}',
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
                                      onTap: () =>
                                          controller.removeFavoriteCart(
                                              controller.myFavoritesList[index]
                                                  ['favorites_id']),
                                      child: Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.red.withOpacity(0.9),
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
