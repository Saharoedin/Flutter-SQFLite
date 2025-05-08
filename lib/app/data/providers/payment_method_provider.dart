import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../models/payment_method_model.dart';

class PaymentMethodProvider extends GetConnect {
  static Future<List<PaymentMethod>> fetchData() async {
    final db = await DbHelper.database;
    final data = await db.query('payment_methods');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => PaymentMethod.fromJson(e),
        )
        .toList();
  }

  static Future<void> insertData(PaymentMethod data) async {
    final db = await DbHelper.database;
    await db.insert(
      'payment_methods',
      data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateData(PaymentMethod data) async {
    final db = await DbHelper.database;
    await db.update(
      'payment_methods',
      data.toJson(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  static Future<void> deleteData(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'payment_methods',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
