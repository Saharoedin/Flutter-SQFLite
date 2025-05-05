import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../models/unit_model.dart';

class UnitProvider extends GetConnect {
  static Future<List<Unit>> fetchData() async {
    final db = await DbHelper.database;
    final data = await db.query('units');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => Unit.fromJson(e),
        )
        .toList();
  }

  static Future insertData(Unit unit) async {
    final db = await DbHelper.database;
    await db.insert(
      'units',
      unit.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future updateData(Unit unit) async {
    final db = await DbHelper.database;
    await db.update(
      'units',
      unit.toJson(),
      where: 'id = ?',
      whereArgs: [unit.id],
    );
  }

  static Future deleteData(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'units',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
