class ItemModel {
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
  int? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesNameFr;
  String? categoriesImage;
  String? categoriesDateTime;

  ItemModel(
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
      this.categoriesId,
      this.categoriesNameEn,
      this.categoriesNameAr,
      this.categoriesNameFr,
      this.categoriesImage,
      this.categoriesDateTime});

  ItemModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesImage = json['categories_image'];
    categoriesDateTime = json['categories_date_time'];
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
    data['categories_id'] = categoriesId;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_fr'] = categoriesNameFr;
    data['categories_image'] = categoriesImage;
    data['categories_date_time'] = categoriesDateTime;
    return data;
  }
}