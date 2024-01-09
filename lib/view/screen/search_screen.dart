import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/status_request.dart';

import '../../controller/homeController/search_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../link_api.dart';
import '../widget/Auth/custom_text_form_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImpl());

    return SafeArea(
      child: GetBuilder<SearchControllerImpl>(
        builder: (controller) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.keyword,
                        fontSize: 14,
                        borderRadius: 12,
                        hintText: 'Search Product',
                        borderSideColor: Colors.white.withOpacity(0.9),
                        fillColor: Colors.orange.withOpacity(0.1),
                        onChanged: (p0) => controller.search(
                          controller.keyword.text,
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                controller.keyword.text.isEmpty
                    ? controller.searchHistory.isEmpty
                        ? Container()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Search History',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.9),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    mainAxisExtent: 30,
                                  ),
                                  itemCount: controller.searchHistory.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      controller.keyword.text =
                                          controller.searchHistory[index];
                                      controller
                                          .search(controller.keyword.text);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.05),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        controller.searchHistory[index],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                    : switch (controller.statusRequest) {
                        StatusRequest.loading => const Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Loading...'),
                              SizedBox(width: 8),
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                  strokeWidth: 3,
                                ),
                              )
                            ],
                          )),
                        StatusRequest.failure => Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: Get.height - 200,
                              width: 250,
                              child: Text(
                                'No product found, Please enter another keyword.',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        StatusRequest.success => ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.searchList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.addToHistory(
                                    translateDatabase(
                                      controller.searchList[index].itemsDescAr!,
                                      controller.searchList[index].itemsNameEn!,
                                      controller.searchList[index].itemsDescFr!,
                                    ),
                                  );
                                  controller.goToItemDetails(
                                    {
                                      "items_id":
                                          controller.searchList[index].itemsId,
                                      "items_name_en": controller
                                          .searchList[index].itemsNameEn,
                                      "items_name_ar": controller
                                          .searchList[index].itemsNameAr,
                                      "items_name_fr": controller
                                          .searchList[index].itemsNameFr,
                                      "items_desc_en": controller
                                          .searchList[index].itemsDescEn,
                                      "items_desc_ar": controller
                                          .searchList[index].itemsDescAr,
                                      "items_desc_fr": controller
                                          .searchList[index].itemsDescFr,
                                      "items_discount": controller
                                          .searchList[index].itemsDiscount,
                                      "items_count": controller
                                          .searchList[index].itemsCount,
                                      "items_image": controller
                                          .searchList[index].itemsImage,
                                      "items_price": controller
                                          .searchList[index].itemsPrice,
                                    },
                                  );
                                },
                                child: SizedBox(
                                  height: 90,
                                  child: Card(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: double.infinity,
                                            width: 90,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "${AppLink.itemsImages}/${controller.searchList[index].itemsImage}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 25,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        translateDatabase(
                                                          controller
                                                              .searchList[index]
                                                              .itemsNameAr!,
                                                          controller
                                                              .searchList[index]
                                                              .itemsNameEn!,
                                                          controller
                                                              .searchList[index]
                                                              .itemsNameFr!,
                                                        ),
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  translateDatabase(
                                                    controller.searchList[index]
                                                        .itemsDescAr!,
                                                    controller.searchList[index]
                                                        .itemsDescEn!,
                                                    controller.searchList[index]
                                                        .itemsDescFr!,
                                                  ),
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                          .searchList[index]
                                                          .itemsPrice
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.orange,
                                                        inherit: false,
                                                      ),
                                                    ),
                                                    const Text(
                                                      '\$',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        inherit: false,
                                                        height: 1.2,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        StatusRequest.serverException => Container(),
                        StatusRequest.offlineFailure => Container(),
                        StatusRequest.serverFailure => Container(),
                        StatusRequest.none => Container(),
                      }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
