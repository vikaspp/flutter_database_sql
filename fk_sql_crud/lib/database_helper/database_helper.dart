import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:fk_sql_crud/model/employee_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _DatabaseHelper = DatabaseHelper._internal();
  factory DatabaseHelper() => _DatabaseHelper;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'employee_crud.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store designation
  // and a table to store employee.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE designations(id INTEGER PRIMARY KEY, designation TEXT)',
    );
     await db.execute(
      'CREATE TABLE employees(id INTEGER PRIMARY KEY, firstName TEXT,lastName TEXT,email TEXT,dob TEXT,salary TEXT,image TEXT,designationID INTEGER,'
          ' FOREIGN KEY (designationId) REFERENCES designations(id) ON DELETE SET NULL)',
    );
  }

  Future<void> insertDesignation(Designation designation) async{
    final db = await _DatabaseHelper.database;
    await db.insert('designations', designation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // // Define a function that inserts breeds into the database
  // Future<void> insertBreed(Breed breed) async {
  //   // Get a reference to the database.
  //   final db = await _DatabaseHelper.database;
  //
  //   // Insert the Breed into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same breed is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'breeds',
  //     breed.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  Future<void> insertEmployee(Employee employee) async{
    final db = await _DatabaseHelper.database;
    await db.insert('employees',
    employee.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // Future<void> insertDog(Dog dog) async {
  //   final db = await _DatabaseHelper.database;
  //   await db.insert(
  //     'dogs',
  //     dog.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // A method that retrieves all the breeds from the breeds table.
  Future<List<Designation>> designations() async {
   final db = await _DatabaseHelper.database;
   final List<Map<String ,dynamic>> maps = await db.query('designations');
   return List.generate(maps.length, (index) => Designation.fromMap(maps[index]));
  }
  // Future<List<Breed>> breeds() async {
  //   // Get a reference to the database.
  //   final db = await _DatabaseHelper.database;
  //
  //   // Query the table for all the Breeds.
  //   final List<Map<String, dynamic>> maps = await db.query('breeds');
  //
  //   // Convert the List<Map<String, dynamic> into a List<Breed>.
  //   return List.generate(maps.length, (index) => Breed.fromMap(maps[index]));
  // }
  Future<Designation> designation(int id)async {
    final db = await _DatabaseHelper.database;
    final List<Map<String, dynamic>> maps =
    await db.query('designations', where: 'id = ?', whereArgs: [id]);
    return Designation.fromMap(maps[0]);
  }

  // Future<Breed> breed(int id) async {
  //   final db = await _DatabaseHelper.database;
  //   final List<Map<String, dynamic>> maps =
  //   await db.query('breeds', where: 'id = ?', whereArgs: [id]);
  //   return Breed.fromMap(maps[0]);
  // }


  Future<List<Employee>> employees() async {
    final db = await _DatabaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('employees');
    return List.generate(maps.length, (index) => Employee.fromMap(maps[index]));
  }

  Future<void> updateDesignation(Designation designation) async {
    // Get a reference to the database.
    final db = await _DatabaseHelper.database;

    // Update the given designation
    await db.update(
      'designations',
      designation.toMap(),

      where: 'id = ?',

      whereArgs: [designation.id],
    );
  }

  Future<void> updateEmployee(Employee employee) async {
    final db = await _DatabaseHelper.database;
    await db.update('employees', employee.toMap(), where: 'id = ?', whereArgs: [employee.id]);
  }


  Future<void> deleteDesignations(int id) async {
    // Get a reference to the database.
    final db = await _DatabaseHelper.database;

     await db.delete(
      'designations',
        where: 'id = ?',
        whereArgs: [id],
    );
  }

  Future<void> deleteEmployee(int id) async {
    final db = await _DatabaseHelper.database;
    await db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }
}