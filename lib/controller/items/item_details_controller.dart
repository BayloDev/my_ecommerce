import 'package:get/get.dart';
import 'package:my_ecommerce/core/constant/routes.dart';

abstract class ItemsDetailsController extends GetxController {
  addToCart();
  changeSelectedColor(int index);
  minProductCount();
  addProductCount();
}

class ItemsDetailsControllerImpl extends ItemsDetailsController {
  Map itemDetails = {};
  int productCount = 1;
  int selectedColor = 1;
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

  @override
  addProductCount() {
    if (itemDetails['items_count'] > productCount) {
      productCount++;
      update();
    }
  }

  @override
  minProductCount() {
    if (productCount > 1) {
      productCount--;
      update();
    }
  }
}
