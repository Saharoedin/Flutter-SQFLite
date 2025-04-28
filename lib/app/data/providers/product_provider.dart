import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

class ProductProvider extends GetConnect {
  static Future<List<Product>> fetchProducts() async {
    final db = await DbHelper.database;
    final data = await db.query('products');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => Product.fromJson(e),
        )
        .toList();
  }

  static Future<void> insert(Product product) async {
    final db = await DbHelper.database;
    await db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(Product product) async {
    final db = await DbHelper.database;
    await db.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  static Future<void> remove(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
