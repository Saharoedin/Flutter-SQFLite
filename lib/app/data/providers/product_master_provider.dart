import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:get/get.dart';

import '../models/product_master_model.dart';

class ProductMasterProvider extends GetConnect {
  static Future<List<ProductMaster>> fetchData() async {
    final db = await DbHelper.database;
    final data = await db.rawQuery('''
      SELECT 
      products.id, 
      products.name, 
      products.description, 
      products.price, 
      products.discount, 
      products.image_path, 
      products.is_customizable, 
      products.created_at, 
      products.updated_at, 
      categories.id AS category_id, 
      categories.name AS category_name, 
      units.id AS unit_id, 
      units.name AS unit_name
      FROM products
      LEFT JOIN categories ON products.category_id = categories.id
      LEFT JOIN units ON products.unit_id = units.id
    ''');
    print(data.length);

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => ProductMaster.fromJson(e),
        )
        .toList();
  }
}
