import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:flutter_sqflite/app/data/models/transaction_detail_model.dart';

class TransactionDetailProvider {
  static Future<List<TransactionDetail>> fetchTransactions() async {
    final db = await DbHelper.database;
    final data = await db.query('transaction_details');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => TransactionDetail.fromJson(e),
        )
        .toList();
  }

  static Future<void> insert(TransactionDetail transactionDetail) async {
    final db = await DbHelper.database;
    await db.insert('transaction_details', transactionDetail.toJson());
  }

  static Future<void> update(TransactionDetail transactionDetail) async {
    final db = await DbHelper.database;
    await db.update(
      'transaction_details',
      transactionDetail.toJson(),
      where: 'id = ?',
      whereArgs: [transactionDetail.id],
    );
  }

  static Future<void> remove(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'transaction_details',
      where: 'id = ?',
      whereArgs: ['id'],
    );
  }
}
