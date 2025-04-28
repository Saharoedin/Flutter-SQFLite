class ProductWithCategory {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  String? categoryName;
  String? createdAt;
  String? updatedAt;

  ProductWithCategory({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
  });

  ProductWithCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<ProductWithCategory> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<ProductWithCategory>.empty();

    return data
        .map(
          (e) => ProductWithCategory.fromJson(e),
        )
        .toList();
  }
}
