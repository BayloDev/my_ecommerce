class CategoriesModel {
  int? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesNameFr;
  String? categoriesImage;
  String? categoriesDateTime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesNameEn,
      this.categoriesNameAr,
      this.categoriesNameFr,
      this.categoriesImage,
      this.categoriesDateTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameFr = json['categories_name_fr'];
    categoriesImage = json['categories_image'];
    categoriesDateTime = json['categories_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_fr'] = categoriesNameFr;
    data['categories_image'] = categoriesImage;
    data['categories_date_time'] = categoriesDateTime;
    return data;
  }
}
