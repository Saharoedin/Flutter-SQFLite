class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  double? discount;
  int? categoryId;
  int? unitId;
  String? imagePath;
  int? isCustomizable;
  int? picked;
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
    this.picked,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    categoryId = json['category_id'];
    unitId = json['unit_id'];
    imagePath = json['image_path'];
    isCustomizable = json['is_customizable'];
    picked = json['picked'];
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
    data['picked'] = picked;
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
