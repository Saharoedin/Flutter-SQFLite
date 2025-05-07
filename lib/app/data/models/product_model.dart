class Product {
  num? id;
  String? name;
  String? description;
  num? price;
  num? discount;
  num? categoryId;
  num? unitId;
  String? imagePath;
  num? isCustomizable;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.categoryId,
    this.unitId,
    this.imagePath,
    this.isCustomizable,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    name = json['name'];
    description = json['description'];
    price = json['price'] as num?;
    discount = json['discount'] as num?;
    categoryId = json['category_id'] as num?;
    unitId = json['unit_id'] as num?;
    imagePath = json['image_path'];
    isCustomizable = json['is_customizable'] as num?;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['discount'] = discount;
    data['category_id'] = categoryId;
    data['unit_id'] = unitId;
    data['image_path'] = imagePath;
    data['is_customizable'] = isCustomizable;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<Product> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<Product>.empty();
    return data
        .map(
          (e) => Product.fromJson(e),
        )
        .toList();
  }
}
