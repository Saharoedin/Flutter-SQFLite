import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await _createTables(db);
      },
      // onUpgrade: (db, oldVersion, newVersion) async {
      //   await _onUpgradeDb(db, oldVersion, newVersion);
      // },
    );
  }

  static Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE units (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE payment_methods (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        reference TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT NULL,
        price REAL,
        image_path TEXT NULL,
        discount REAL,
        picked REAL,
        unit_id INTEGER,
        is_customizable INTEGER,
        category_id INTEGER,
        created_at TEXT NULL,
        updated_at TEXT NULL,
        FOREIGN KEY (category_id) REFERENCES categories(id)
        FOREIGN KEY (unit_id) REFERENCES units(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NULL,
        order_type TEXT,
        sub_total REAL,
        discount REAL,
        tax REAL,
        grand_total REAL,
        status TEXT,
        payment_id INTEGER,
        created_at TEXT NULL,
        updated_at TEXT NULL,
        FOREIGN KEY (payment_id) REFERENCES payment_methods(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE transaction_details (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transaction_id INTEGER,
        product_id INTEGER,
        qty INTEGER,
        price REAL,
        discount REAL,
        total REAL,
        FOREIGN KEY (transaction_id) REFERENCES transactions(id),
        FOREIGN KEY (product_id) REFERENCES products(id)
      )
    ''');
  }

  static Future<void> _onUpgradeDb(
      Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE transactions');
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        created_at TEXT NULL,
        updated_at TEXT NULL
      )
    ''');
  }

  Future<void> removeDatabase() async {
    final DbPath = await getDatabasesPath();
    final path = join(DbPath, 'app.db');

    await deleteDatabase(path);

    print('Database successfully removed');
  }
}
