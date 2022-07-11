import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection{
  Future<Database>setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'employee_db');
    var database =
    await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }
  Future<void>_createDatabase(Database database, int version) async {
    String sql=
        "CREATE TABLE employee (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,lastName Text,email TEXT,desi TEXT,dob TEXT,img TEXT,salary TEXT);";
    await database.execute(sql);
  }
}