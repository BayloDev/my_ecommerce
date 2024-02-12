import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/colors.dart';
import 'package:my_ecommerce/core/constant/routes.dart';
import 'package:my_ecommerce/data/model/item_model.dart';

import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomItemCard extends StatelessWidget {
  final int index;
  final List<ItemModel> data;
  final Map<int, int>? favorites;
  final Widget? removeOrFavorite;
  final bool isHome;
  const CustomItemCard({
    super.key,
    required this.index,
    required this.data,
    required this.isHome,
    this.favorites,
    this.removeOrFavorite,
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
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 200,
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
                  Container(
                    height: !isHome ? 15 : 12,
                    color: Colors.black.withOpacity(0.05),
                  ),
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
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            translateDatabase(
                              data[index].itemsNameAr!,
                              data[index].itemsNameEn!,
                              data[index].itemsNameFr!,
                            ),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: !isHome ? 12 : 11,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Text(
                                'Sold: ',
                                style: TextStyle(
                                  fontSize: !isHome ? 12 : 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                '${data[index].itemsCount}',
                                style: TextStyle(
                                  fontSize: !isHome ? 12 : 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                  inherit: false,
                                  height: !isHome ? 1.7 : 1.5,
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
              data[index].itemsDiscount != 0
                  ? Positioned(
                      top: 0,
                      left: 0,
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
                            color: Colors.orange.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            '-${data[index].itemsDiscount}%',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                              fontSize: !isHome ? 12 : 11,
                              inherit: false,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      '${data[index].itemsPrice} \$',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: !isHome ? 12 : 11,
                        inherit: false,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: removeOrFavorite ?? Container(),
              ),
              Positioned(
                bottom: !isHome ? 37 : 33,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: !isHome ? 15 : 13,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    Icon(
                      Icons.star,
                      size: !isHome ? 15 : 13,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    Icon(
                      Icons.star,
                      size: !isHome ? 15 : 13,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    Icon(
                      Icons.star_half,
                      size: !isHome ? 15 : 13,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    Icon(
                      Icons.star_border_outlined,
                      size: !isHome ? 15 : 13,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
