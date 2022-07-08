import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE employee(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        lastName TEXT NOT NULL,
        desi TEXT NOT NULL,
        img BLOB NOT NULL,
        salary String NOT NULL,
        dob TEXT NOT NULL,
        email TEXT NOT NULL
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }


  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'employee.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }


  static Future<int> createItem(String name, String? lastName,String? desi,String? img,String salary,String dob,String email) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'last': lastName,'desi' : desi,'img' : img,'salary':salary,'dob':dob,'email':email};
    final id = await db.insert('employee', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }


  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('employee', orderBy: "id");
  }


  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('employee', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String name, String? lastName,String? desi,String? img,String salary,String dob,String email) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name, 'last': lastName,'desi' : desi,'img' : img,'salary':salary,'dob':dob,'email':email,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('employee', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("employee", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}