import 'package:flutter/Material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../database_helper.dart';
import '../model/cart_model.dart';

class MartDatabaseHelper {
  late DatabaseHelper _databaseHelper;

  MartDatabaseHelper() {
    _databaseHelper = DatabaseHelper.instance;
    debugPrint("DATABASE CREATED");
  }

  Future<void> insertOrUpdateCart(Cart cart) async {
    Database db = await _databaseHelper.database;
    await db.transaction((txn) async {
      final List<Map<String, dynamic>> maps = await txn.query(
        'cart',
        where: 'product_id = ?',
        whereArgs: [cart.productId],
      );

      if (maps.isNotEmpty) {
        int id = maps.first['id'];
        int newQuantity = cart.quantity;

        await txn.update(
          'cart',
          {'quantity': newQuantity},
          where: 'id = ?',
          whereArgs: [id],
        );
      } else {
        await txn.insert(
          'cart',
          cart.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
    });
  }

  Future<List<Cart>> queryAllCart() async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (i) {
      return Cart.fromMap(maps[i]);
    });
  }

  Future<Cart?> getById(int id) async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Cart.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> getQuantity(int productId) async{
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      columns: ['quantity'],
      where: 'product_id = ?',
      whereArgs: [productId],
    );

    if (maps.isNotEmpty) {
      int x=Sqflite.firstIntValue(maps)!;
      debugPrint(x.toString());
      return x;
    }
    return 0;
  }

  Future<Cart?> getByProductId(int productId) async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      where: 'product_id = ?',
      whereArgs: [productId],
    );
    if (maps.isNotEmpty) {
      return Cart.fromMap(maps.first);
    }
    return null;
  }

  Future<bool> isProductInCart(int productId) async {
    Database db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      where: 'product_id = ?',
      whereArgs: [productId],
    );
    if (maps.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<int> totalCount() async {
    Database db = await _databaseHelper.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM cart');
    int count = Sqflite.firstIntValue(result)!;
    return count;
  }

  Future<void> deleteCart(int id) async {
    Database db = await _databaseHelper.database;
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteByProductId(int productId) async {
    Database db = await _databaseHelper.database;
    await db.delete(
      'cart',
      where: 'product_id = ?',
      whereArgs: [productId],
    );
  }
}
