import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:get/get.dart';

import '../models/product_with_category_model.dart';

class ProductWithCategoryProvider extends GetConnect {
  static Future<List<ProductWithCategory>> fetchProductWithCategory() async {
    final db = await DbHelper.database;
    final data = await db.rawQuery('''
      SELECT products.id, products.name, products.description, products.created_at, products.updated_at, categories.id AS category_id, categories.name AS category_name 
      FROM products
      LEFT JOIN categories ON products.category_id = categories.id
    ''');
    print(data.length);

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => ProductWithCategory.fromJson(e),
        )
        .toList();
  }
}
