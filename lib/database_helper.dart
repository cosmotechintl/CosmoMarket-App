import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cosmomarket_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    String path = join(await getDatabasesPath(), filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _create,
    );
  }

  Future<void> _create(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER NOT NULL UNIQUE,
        image Text Not Null,
        name TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL
      )
    ''');
  }

  void close() {
    if (_database != null) {
      _database?.close();
    }
  }
}
