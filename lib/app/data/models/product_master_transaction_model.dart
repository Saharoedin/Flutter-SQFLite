class ProductMasterTransaction {
  int? id;
  String? name;
  String? description;
  double? price;
  double? discount;
  int? categoryId;
  String? categoryName;
  int? unitId;
  String? unitName;
  String? imagePath;
  int? isCustomizable;
  double? picked;

  ProductMasterTransaction({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.categoryId,
    this.categoryName,
    this.unitId,
    this.unitName,
    this.imagePath,
    this.isCustomizable,
    this.picked,
  });

  ProductMasterTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    unitId = json['unit_id'];
    unitName = json['unit_name'];
    imagePath = json['image_path'];
    isCustomizable = json['is_customizable'];
    picked = json['picked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['discount'] = discount;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['unit_id'] = unitId;
    data['unit_name'] = unitName;
    data['image_path'] = imagePath;
    data['is_customizable'] = isCustomizable;
    data['picked'] = picked;
    return data;
  }
}
