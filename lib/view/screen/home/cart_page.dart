import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/core/class/handling_data_view.dart';
import 'package:my_ecommerce/core/functions/translate_database.dart';
import 'package:my_ecommerce/link_api.dart';
import 'package:my_ecommerce/view/widget/CustomWidgets/custom_appbar.dart';
import '../../../controller/cart/cart_controller.dart';

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
            backgroundColor: Colors.black.withOpacity(0.01),
            leading: Container(),
            toolbarHeight: 140,
            flexibleSpace: const CustomAppBar(title: 'Cart(2)'),
          ),
          body: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.black.withOpacity(0.01),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) => SizedBox(
                          height: 100,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.itemsImages}/${controller.cartItems[index].itemsImage}",
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Spacer(flex: 2),
                                      Text(
                                        translateDatabase(
                                          controller
                                              .cartItems[index].itemsNameAr!,
                                          controller
                                              .cartItems[index].itemsNameEn!,
                                          controller
                                              .cartItems[index].itemsNameFr!,
                                        ),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const Spacer(
                                        flex: 3,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            controller
                                                .cartItems[index].itemsPrice
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                          Text(
                                            '\$',
                                            style: TextStyle(
                                              fontSize: 16,
                                              inherit: false,
                                              height: 1.7,
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                      const Spacer(flex: 2),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black.withOpacity(0.5),
                                        size: 22,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${controller.cartItems[index].cartItemNumber}',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        textBaseline: TextBaseline.ideographic,
                                        inherit: false,
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black.withOpacity(0.5),
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              Text(
                                controller.totalPrice.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.deepOrange,
                                    inherit: false,
                                    height: 1.6),
                              ),
                              const Text(
                                ' \$',
                                style: TextStyle(
                                  fontSize: 16,
                                  inherit: false,
                                  height: 1.7,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Shipping',
                                style: TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              Text(
                                controller.shipping.toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.deepOrange,
                                  inherit: false,
                                  height: 1.7,
                                ),
                              ),
                              const Text(
                                ' \$',
                                style: TextStyle(
                                  fontSize: 16,
                                  inherit: false,
                                  height: 1.7,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Total price',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Spacer(),
                              Text(
                                (controller.totalPrice + controller.shipping)
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.teal,
                                  inherit: false,
                                  height: 1.7,
                                ),
                              ),
                              const Text(
                                ' \$',
                                style: TextStyle(
                                  fontSize: 20,
                                  inherit: false,
                                  height: 1.7,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Colors.orange,
                                ),
                              ),
                              child: Text(
                                'Checkout(${controller.count})',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          )
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
