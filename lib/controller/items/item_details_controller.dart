import 'package:get/get.dart';
import 'package:my_ecommerce/controller/cart/cart_controller.dart';
import 'package:my_ecommerce/core/constant/routes.dart';

abstract class ItemsDetailsController extends GetxController {
  addToCart();
  changeSelectedColor(int index);
}

class ItemsDetailsControllerImpl extends ItemsDetailsController {
  Map itemDetails = {};
  int selectedColor = 1;
  CartControllerImpl cartController = Get.put(CartControllerImpl());
  @override
  void onInit() {
    itemDetails = Get.arguments['item'];
    itemDetails['items_color'] = [ 
      'Yellow',
      'Black',
      'Green',
      'White',
      'red',
      'orange'
    ];
    super.onInit();
  }

  @override
  addToCart() async {
    Get.toNamed(AppRoutes.favorite);
  }

  @override
  changeSelectedColor(int index) {
    selectedColor = index;
    update();
  }
}
