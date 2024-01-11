import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/colors.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomItemCard extends StatelessWidget {
  final dynamic controller;
  final int index;
  final List<ItemModel> data;
  final Map<int, int> favorites;
  final Widget removeOrFavorite;
  const CustomItemCard({
    super.key,
    required this.controller,
    required this.index,
    required this.data,
    required this.favorites,
    required this.removeOrFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.itemDetails, arguments: {
          'item': {
            "items_id": data[index].itemsId,
            "items_name": translateDatabase(
              data[index].itemsNameAr!,
              data[index].itemsNameEn!,
              data[index].itemsNameFr!,
            ),
            "items_desc": translateDatabase(
              data[index].itemsDescAr!,
              data[index].itemsDescEn!,
              data[index].itemsDescFr!,
            ),
            "items_discount": data[index].itemsDiscount,
            "items_count": data[index].itemsCount,
            "items_image": data[index].itemsImage,
            "items_price": data[index].itemsPrice,
          },
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
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
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Hero(
                        tag: data[index].itemsId!,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppLink.itemsImages}/${data[index].itemsImage}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: AppColor.secondaryColor.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                        ),
                        child: Text(
                          translateDatabase(
                            data[index].itemsNameAr!,
                            data[index].itemsNameEn!,
                            data[index].itemsNameFr!,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          bottom: 2,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Sold : ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${data[index].itemsCount}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
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
              child: data[index].itemsDiscount != 0
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '-${data[index].itemsDiscount!}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
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
                          )),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${data[index].itemsPrice}',
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
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: removeOrFavorite,
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
    );
  }
}
