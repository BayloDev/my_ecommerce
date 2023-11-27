import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart/cart_controller.dart';
import 'package:my_ecommerce/controller/items/item_details_controller.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';

import '../../../link_api.dart';
import '../../widget/CustomWidgets/custom_title_h1.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImpl());
    Get.put(CartControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ItemsDetailsControllerImpl>(
          builder: (controller) => Container(
            color: Colors.black.withOpacity(0.02),
            child: Stack(
              children: [
                Container(
                  height: Get.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.orange.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const CustomTitleH1(
                            text: 'Product Details',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ],
                      ),
                      Hero(
                        tag: controller.itemDetails['items_id'],
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: Get.height / 4,
                          width: Get.width / 1.4,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppLink.itemsImages}/${controller.itemDetails['items_image']}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            //spreadRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 26,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  translateDatabase(
                                    controller.itemDetails['items_name_ar'],
                                    controller.itemDetails['items_name_en'],
                                    controller.itemDetails['items_name_fr'],
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  '${controller.itemDetails['items_price']}\$',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.orange.shade600,
                                      fontWeight: FontWeight.bold,
                                      inherit: false,
                                      height: 1.3),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 18,
                                      color: Colors.orange.withOpacity(0.9)),
                                  Icon(Icons.star,
                                      size: 18,
                                      color: Colors.orange.withOpacity(0.9)),
                                  Icon(Icons.star,
                                      size: 18,
                                      color: Colors.orange.withOpacity(0.9)),
                                  Icon(Icons.star_half,
                                      size: 18,
                                      color: Colors.orange.withOpacity(0.9)),
                                  Icon(Icons.star_border_outlined,
                                      size: 18,
                                      color: Colors.orange.withOpacity(0.9)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                'Sold : ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                '${controller.itemDetails['items_count']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                  inherit: false,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Description :',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 80,
                            child: ListView(
                              children: [
                                Text(
                                  translateDatabase(
                                    controller.itemDetails['items_desc_ar'],
                                    controller.itemDetails['items_desc_en'],
                                    controller.itemDetails['items_desc_fr'],
                                  ),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          controller.itemDetails['items_color'] != null
                              ? Text(
                                  'Color :',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 10),
                          controller.itemDetails['items_color'] != null
                              ? SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    itemCount: controller
                                        .itemDetails['items_color'].length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: const EdgeInsets.all(4),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            index == controller.selectedColor
                                                ? Colors.teal
                                                : Colors.white
                                                    .withOpacity(0.95),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                width: 1,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(4),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                            Colors.black.withOpacity(0.3),
                                          ),
                                        ),
                                        onPressed: () => controller
                                            .changeSelectedColor(index),
                                        child: Text(
                                          controller.itemDetails['items_color']
                                              [index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index ==
                                                    controller.selectedColor
                                                ? Colors.white.withOpacity(0.95)
                                                : Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 35,
                            child: GetBuilder<CartControllerImpl>(
                              builder: (cartController) => Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        cartController.countMinus(),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 22,
                                    ),
                                  ),
                                  Text(
                                    '${cartController.count}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      textBaseline: TextBaseline.ideographic,
                                      inherit: false,
                                      height: 1.4,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => cartController.countPlus(),
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 22,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 40,
                                    child: GetBuilder<CartControllerImpl>(
                                      builder: (cartController) =>
                                          ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange.shade400),
                                        ),
                                        onPressed: () =>
                                            cartController.addItemToCart(
                                          controller.itemDetails['items_id'],
                                        ),
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Add To Cart',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              size: 20,
                                              Icons.arrow_forward_rounded,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
