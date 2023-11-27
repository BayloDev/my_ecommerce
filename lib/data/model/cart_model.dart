class CartModel {
  int? itemsId;
  String? itemsNameEn;
  String? itemsNameAr;
  String? itemsNameFr;
  String? itemsDescEn;
  String? itemsDescAr;
  String? itemsDescFr;
  String? itemsDateTime;
  int? itemsActive;
  int? itemsDiscount;
  int? itemsCount;
  String? itemsImage;
  int? itemsPrice;
  int? itemsCategories;
  int? cartId;
  int? cartUserId;
  int? cartItemId;
  int? cartItemNumber;
  int? totalPrice;

  CartModel(
      {this.itemsId,
      this.itemsNameEn,
      this.itemsNameAr,
      this.itemsNameFr,
      this.itemsDescEn,
      this.itemsDescAr,
      this.itemsDescFr,
      this.itemsDateTime,
      this.itemsActive,
      this.itemsDiscount,
      this.itemsCount,
      this.itemsImage,
      this.itemsPrice,
      this.itemsCategories,
      this.cartId,
      this.cartUserId,
      this.cartItemId,
      this.cartItemNumber,
      this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsNameFr = json['items_name_fr'];
    itemsDescEn = json['items_desc_en'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescFr = json['items_desc_fr'];
    itemsDateTime = json['items_date_time'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsCount = json['items_count'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsCategories = json['items_categories'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    cartItemNumber = json['cart_item_number'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name_en'] = itemsNameEn;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_fr'] = itemsNameFr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_fr'] = itemsDescFr;
    data['items_date_time'] = itemsDateTime;
    data['items_active'] = itemsActive;
    data['items_discount'] = itemsDiscount;
    data['items_count'] = itemsCount;
    data['items_image'] = itemsImage;
    data['items_price'] = itemsPrice;
    data['items_categories'] = itemsCategories;
    data['cart_id'] = cartId;
    data['cart_user_id'] = cartUserId;
    data['cart_item_id'] = cartItemId;
    data['cart_item_number'] = cartItemNumber;
    data['total_price'] = totalPrice;
    return data;
  }
}
