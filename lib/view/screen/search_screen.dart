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
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Row(
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
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 20),
                controller.statusRequest == StatusRequest.loading
                    ? const Center(child: Text('Loading...'))
                    : controller.statusRequest == StatusRequest.success
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.searchList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => controller.goToItemDetails(
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
                                    "items_discount": 10,
                                    "items_count": 100,
                                    "items_image": "hp840g1.png",
                                    "items_price": 300,
                                  },
                                ),
                                child: SizedBox(
                                  height: 110,
                                  child: Card(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                "${AppLink.itemsImages}/${controller.searchList[index].itemsImage}",
                                            fit: BoxFit.fill,
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
                          )
                        : Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 250,
                              child:  Text(
                                'No product found, Please enter another keyword.',
                                style: TextStyle(color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
