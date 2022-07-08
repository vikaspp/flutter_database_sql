import 'package:database_crud/model/employee_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;
  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }
  initDatabase()async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'employee.db');
    var db = await openDatabase(path , version: 1,onCreate: _onCreate);
  }
  _onCreate(Database db , int version)async{
    await db.execute('CREATE TABLE employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,lastName TEXT NOT NULL,desi TEXT NOT NULL,img BLOB NOT NULL,salary DOUBLE NOT NULL,dob TEXT NOT NULL,email TEXT NOT NULL)');

  }
  Future<Employee> insert(Employee employee)async{
    var dbEmployee = await db;
    await dbEmployee?.insert('employee', employee.toMap());
    return employee;
  }

  Future<List<Employee>> getEmployeeList () async{
    var dbEmployee = await db;
    final List<Map<String,Object?>> queryResult = await dbEmployee!.query('employee');
    return queryResult.map((e) => Employee.fromMap(e)).toList();
  }

}