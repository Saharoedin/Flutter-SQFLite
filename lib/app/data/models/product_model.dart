class Product {
  num? id;
  String? name;
  String? description;
  num? categoryId;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<Product> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<Product>.empty();

    return data.map((e) => Product.fromJson(e)).toList();
  }
}
