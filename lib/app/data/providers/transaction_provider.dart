import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:flutter_sqflite/app/data/models/transaction_model.dart';

class TransactionProvider {
  static Future<List<Transaction>> fetchTransactions() async {
    final db = await DbHelper.database;
    final data = await db.query('transactions');

    if (data.isEmpty) return [];
    return data
        .map(
          (e) => Transaction.fromJson(e),
        )
        .toList();
  }

  static Future<void> insert(Transaction transaction) async {
    final db = await DbHelper.database;
    await db.insert('transactions', transaction.toJson());
  }

  static Future<void> update(Transaction transaction) async {
    final db = await DbHelper.database;
    await db.update(
      'transactions',
      transaction.toJson(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  static Future<void> remove(int id) async {
    final db = await DbHelper.database;
    await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: ['id'],
    );
  }
}
