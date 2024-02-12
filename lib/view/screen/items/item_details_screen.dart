import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controller/homeController/cart_controller.dart';
import 'package:my_ecommerce/controller/items/item_details_controller.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';

import '../../../core/constant/colors.dart';
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
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.orange.withOpacity(0.2),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.orange.withOpacity(0.01),
                              Colors.orange.withOpacity(0.1),
                              Colors.orange.withOpacity(0.3),
                              Colors.orange.withOpacity(0.5),
                              Colors.orange.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 26,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.itemDetails['items_name']}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.secondaryColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    '${controller.itemDetails['items_price']}\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      inherit: false,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 18,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.orange.withOpacity(0.9),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.orange.withOpacity(0.9),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.orange.withOpacity(0.9),
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    size: 18,
                                    color: Colors.orange.withOpacity(0.9),
                                  ),
                                  Icon(
                                    Icons.star_border_outlined,
                                    size: 18,
                                    color: Colors.orange.withOpacity(0.9),
                                  ),
                                  const Spacer(),
                                  controller.itemDetails['items_discount'] != 0
                                      ? Text(
                                          '-${controller.itemDetails['items_discount']}%',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange.shade600,
                                            inherit: false,
                                            height: 1.4,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 18,
                              child: Row(
                                children: [
                                  Text(
                                    'Sold : ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  Text(
                                    '${controller.itemDetails['items_count']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5),
                                      inherit: false,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 20,
                              child: Text(
                                'Description :',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${controller.size.width / (Get.width )}',
                            ),
                            Container(
                              color: Colors.white.withOpacity(0.6),
                              height: Get.height * 0.2,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              padding: const EdgeInsets.all(4),
                              child: ListView(
                                children: [
                                  Text(
                                    controller.itemDetails['items_desc'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            controller.itemDetails['items_color'] != null
                                ? Text(
                                    'Color :',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                            controller.itemDetails['items_color'] != null
                                ? SizedBox(
                                    height: 22,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .itemDetails['items_color'].length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        margin: const EdgeInsets.only(right: 6),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shadowColor:
                                                const MaterialStatePropertyAll(
                                              Colors.white,
                                            ),
                                            padding:
                                                const MaterialStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              index == controller.selectedColor
                                                  ? AppColor.secondaryColor
                                                  : Colors.white,
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                  width: 1,
                                                  color: Colors.black
                                                      .withOpacity(0.05),
                                                ),
                                              ),
                                            ),
                                            elevation:
                                                MaterialStateProperty.all(0.2),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                              Colors.black.withOpacity(0.2),
                                            ),
                                          ),
                                          onPressed: () => controller
                                              .changeSelectedColor(index),
                                          child: Text(
                                            controller
                                                    .itemDetails['items_color']
                                                [index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: index ==
                                                      controller.selectedColor
                                                  ? Colors.white
                                                      .withOpacity(0.95)
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(0),
                                      ),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                        Colors.white,
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 18,
                                    ),
                                    onPressed: () => controller.countMinus(),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${controller.count}',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    textBaseline: TextBaseline.ideographic,
                                    inherit: false,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(0),
                                      ),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                        Colors.white,
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 18,
                                    ),
                                    onPressed: () => controller.countPlus(),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 32,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.orange.shade400,
                                      ),
                                      padding: const MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(horizontal: 10)),
                                    ),
                                    onPressed: () => controller.addItemToCart(
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
                                        SizedBox(width: 4),
                                        Icon(
                                          size: 20,
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomTitleH1(
                              text: 'Product Details',
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 24,
                            ),
                          ],
                        ),
                        Hero(
                          tag: controller.itemDetails['items_id'],
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 180,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
