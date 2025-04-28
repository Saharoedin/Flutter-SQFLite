import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoryProvider {
  static Future<List<CategoryModel>> fetchCategories() async {
    final db = await DbHelper.database;
    final data = await db.query('categories');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => CategoryModel.fromJson(e),
        )
        .toList();
  }

  static Future<void> insert(CategoryModel category) async {
    final db = await DbHelper.database;
    await db.insert(
      'categories',
      category.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(CategoryModel category) async {
    final db = await DbHelper.database;
    await db.update('categories', category.toJson(),
        where: 'id = ?', whereArgs: [category.id]);
  }

  static Future<void> remove(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
