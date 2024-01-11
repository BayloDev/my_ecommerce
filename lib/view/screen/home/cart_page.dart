import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_appbar.dart';

import '../../../controller/homeController/cart_controller.dart';
import '../../../core/constant/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImpl());
    return SafeArea(
      child: GetBuilder<CartControllerImpl>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Container(),
            toolbarHeight: 140,
            flexibleSpace:
                CustomAppBar(title: 'Cart(${controller.cartItems.length})'),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.black.withOpacity(0.01),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: controller.onAllCheck,
                          checkColor: Colors.white,
                          fillColor: MaterialStatePropertyAll(
                            controller.onAllCheck
                                ? AppColor.secondaryColor
                                : Colors.white,
                          ),
                          onChanged: (newVal) => controller.checkAll(),
                        ),
                        const Text(
                          'All Items',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => controller.delete(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.goToItemDetails(
                              {
                                "items_id": controller.cartItems[index].itemsId,
                                "items_name": translateDatabase(
                                  controller.cartItems[index].itemsNameAr!,
                                  controller.cartItems[index].itemsNameEn!,
                                  controller.cartItems[index].itemsNameFr!,
                                ),
                                "items_desc": translateDatabase(
                                  controller.cartItems[index].itemsDescAr!,
                                  controller.cartItems[index].itemsDescEn!,
                                  controller.cartItems[index].itemsDescFr!,
                                ),
                                "items_discount": controller.cartItems[index].itemsDiscount,
                                "items_count": controller.cartItems[index].itemsCount,
                                "items_image": controller.cartItems[index].itemsImage,
                                "items_price": controller.cartItems[index].itemsPrice,
                              },
                            ),
                            child: SizedBox(
                              height: 110,
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: double.infinity,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${AppLink.itemsImages}/${controller.cartItems[index].itemsImage}",
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
                                                          .cartItems[index]
                                                          .itemsNameAr!,
                                                      controller
                                                          .cartItems[index]
                                                          .itemsNameEn!,
                                                      controller
                                                          .cartItems[index]
                                                          .itemsNameFr!,
                                                    ),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const Spacer(),
                                                  Checkbox(
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    value: controller
                                                        .checkBoxList[index],
                                                    checkColor: Colors.white,
                                                    fillColor:
                                                        MaterialStatePropertyAll(
                                                      controller.checkBoxList[
                                                                  index] ==
                                                              false
                                                          ? Colors.white
                                                          : AppColor
                                                              .secondaryColor,
                                                    ),
                                                    onChanged: (newVal) =>
                                                        controller
                                                            .onCheckBoxtap(
                                                                index),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              translateDatabase(
                                                controller.cartItems[index]
                                                    .itemsDescAr!,
                                                controller.cartItems[index]
                                                    .itemsDescEn!,
                                                controller.cartItems[index]
                                                    .itemsDescFr!,
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.cartItems[index]
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
                                                const Spacer(),
                                                SizedBox(
                                                  width: 30,
                                                  height: 22,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                        EdgeInsets.all(0),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                        Colors.white
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      size: 18,
                                                    ),
                                                    onPressed: () =>
                                                        controller.countMinus(
                                                      controller
                                                          .cartItems[index]
                                                          .cartId!,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '${controller.cartItems[index].cartItemNumber}',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.w500,
                                                    inherit: false,
                                                    height: 1.3,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                SizedBox(
                                                  width: 30,
                                                  height: 22,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                        EdgeInsets.all(0),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                        Colors.white
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      size: 18,
                                                    ),
                                                    onPressed: () =>
                                                        controller.countPlus(
                                                      controller
                                                          .cartItems[index]
                                                          .cartId!,
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
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.onDown
                              ? Row(
                                  children: [
                                    const Text(
                                      'Price',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.price.toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.6),
                                          inherit: false,
                                          height: 1.6),
                                    ),
                                    Text(
                                      ' \$',
                                      style: TextStyle(
                                        fontSize: 16,
                                        inherit: false,
                                        height: 1.7,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          controller.onDown
                              ? Row(
                                  children: [
                                    const Text(
                                      'Shipping',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.shipping.toString(),
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black.withOpacity(0.6),
                                        inherit: false,
                                        height: 1.7,
                                      ),
                                    ),
                                    Text(
                                      ' \$',
                                      style: TextStyle(
                                        fontSize: 16,
                                        inherit: false,
                                        height: 1.7,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Total : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                (controller.price + controller.shipping)
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(0.6),
                                  inherit: false,
                                  height: 1.7,
                                ),
                              ),
                              Text(
                                ' \$',
                                style: TextStyle(
                                  fontSize: 16,
                                  inherit: false,
                                  height: 1.7,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.changeOnDown(),
                                child: Icon(
                                  controller.onDown
                                      ? Icons.arrow_drop_up_outlined
                                      : Icons.arrow_drop_down_outlined,
                                  color: Colors.black.withOpacity(0.6),
                                  size: 35,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.orange,
                                    ),
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                  ),
                                  child: Text(
                                    'Place Order (${controller.placeOrderCount})',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
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
        ),
      ),
    );
  }
}
